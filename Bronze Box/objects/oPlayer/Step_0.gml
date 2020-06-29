/*
 We need to set a vector to determine which way to move when pressing forward or backward.
 A helpful pnemonic for this is "x, cos y not sin?"
*/
var _vecX = dcos(dir);
var _vecY = -dsin(dir);
image_angle = dir;

var _inMotion = moving || turning;

if (!_inMotion){
	if (keyboard_check(ord("A"))){
		startDir = dir;
		nextDir = dir + 90; // Right...
		turning = true;
	}
	if (keyboard_check(ord("D"))){
		startDir = dir;
		nextDir = dir - 90; // Left...
		turning = true;
	}
}
if (turning){
	if (dir != nextDir){
		// Turn towards next dir
		var _counterPercentTurn = turnCounter / turnCounterMax;
		var _lerpDir = lerp(startDir, nextDir, _counterPercentTurn);
		dir = _lerpDir;
		turnCounter += turnCounterInc;
		// Wrap our dir
		if (dir == 360 || dir == -360){
			dir = 0;
			nextDir = 0;
		}
		fTrace(startDir, nextDir, dir);
	}
	else{
		turning = false;
		turnCounter = 0;
	}
}

var _gridX = x div CELL_SIZE_WORLD;
var _gridY = y div CELL_SIZE_WORLD;

var _moveX = false;
var _moveY = false;

if (!_inMotion){
	if (keyboard_check(ord("W"))){
		// Make sure we're not trying to leave the grid
		_moveX = (_gridX + _vecX) < ds_grid_width(global.world_grid) && (_gridX + _vecX) >= 0;
		_moveY = (_gridY + _vecY) < ds_grid_height(global.world_grid) && (_gridY + _vecY) >= 0;

		if (_moveX && _moveY){
			// Make sure we're not trying to enter a wall
			var _empty = global.world_grid[# _gridX + _vecX, _gridY + _vecY] == __CELL.EMPTY;
			if (_empty){
				startX = x;
				startY = y;
				nextX += CELL_SIZE_WORLD * _vecX;
				nextY += CELL_SIZE_WORLD * _vecY;
				moving = true;
			}
		}
	}
	else if (keyboard_check(ord("S"))){
		// Make sure we're not trying to leave the grid
		_moveX = (_gridX - _vecX) < ds_grid_width(global.world_grid) && (_gridX - _vecX) >= 0;
		_moveY = (_gridY - _vecY) < ds_grid_height(global.world_grid) && (_gridY - _vecY) >= 0;

		if (_moveX && _moveY){
			// Make sure we're not trying to enter a wall
			var _empty = global.world_grid[# _gridX - _vecX, _gridY - _vecY] == __CELL.EMPTY;
			if (_empty){
				startX = x;
				startY = y;
				nextX -= CELL_SIZE_WORLD * _vecX;
				nextY -= CELL_SIZE_WORLD * _vecY;
				moving = true;
			}
		}
	}
}
if (moving){
	if (x != nextX || y != nextY){
		// Move towards next position
		var _counterPercentMove = moveCounter / moveCounterMax;
		var _lerpX = lerp(startX, nextX, _counterPercentMove);
		var _lerpY = lerp(startY, nextY, _counterPercentMove);
		x = _lerpX;
		y = _lerpY;
		moveCounter += moveCounterInc;
	}
	else{
		moving = false;
		moveCounter = 0;
	}
}