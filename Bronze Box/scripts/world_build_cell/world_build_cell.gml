/// @func world_build_cell
/// @desc {void}
/// @arg {real} gridX
/// @arg {real} gridY

var _gridX = argument[0];
var _gridY = argument[1];

var _buildWall = false;

for (var _i = 0; _i < __WALL.SIZE; _i++){
	var _empty = global.world_grid[# _gridX, _gridY] == __CELL.EMPTY;
	if (_empty){
		world_build_wall(_gridX, _gridY, _i);
	}
}