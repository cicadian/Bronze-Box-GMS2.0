/// @func fPlayer_Move
/// @desc {void} runs moving behavior for the player

/*
 We need to set a vector to determine which way to move when pressing forward or backward.
 A helpful pnemonic for this is "x, cos y not sin?"
*/

var _vecX = dcos(dir);
var _vecY = -dsin(dir);

var _gridX = x div CELL_SIZE_WORLD;
var _gridY = y div CELL_SIZE_WORLD;

var _moveX = false;
var _moveY = false;

if (keyboard_check_pressed(ord("W"))){
	// Make sure we're not trying to leave the grid
	_moveX = (_gridX + _vecX) < ds_grid_width(global.world_grid) && (_gridX + _vecX) >= 0;
	_moveY = (_gridY + _vecY) < ds_grid_height(global.world_grid) && (_gridY + _vecY) >= 0;

	if (_moveX && _moveY){
		// Make sure we're not trying to enter a wall
		var _empty = global.world_grid[# _gridX + _vecX, _gridY + _vecY] == __CELL.EMPTY;
		if (_empty){
			x += CELL_SIZE_WORLD * _vecX;
			y += CELL_SIZE_WORLD * _vecY;
		}
	}
}
else if (keyboard_check_pressed(ord("S"))){
	// Make sure we're not trying to leave the grid
	_moveX = (_gridX - _vecX) < ds_grid_width(global.world_grid) && (_gridX - _vecX) >= 0;
	_moveY = (_gridY - _vecY) < ds_grid_height(global.world_grid) && (_gridY - _vecY) >= 0;

	if (_moveX && _moveY){
		// Make sure we're not trying to enter a wall
		var _empty = global.world_grid[# _gridX - _vecX, _gridY - _vecY] == __CELL.EMPTY;
		if (_empty){
			x -= CELL_SIZE_WORLD * _vecX;
			y -= CELL_SIZE_WORLD * _vecY;
		}
	}
}