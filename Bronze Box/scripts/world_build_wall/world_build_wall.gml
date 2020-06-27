/// @func world_build_wall
/// @desc {void} builds the wall of a cell at given coordinates from a given side
/// @arg {real} gridX
/// @arg {real} gridY
/// @arg {real} wall

var _gridX = argument[0];
var _gridY = argument[1];
var _wall = argument[2];

var _x = _gridX * CELL_SIZE_WORLD;
var _y = _gridY * CELL_SIZE_WORLD;
var _z = 0;
var _x2 = _x + CELL_SIZE_WORLD;
var _y2 = _y + CELL_SIZE_WORLD;
var _z2 = _z + CELL_SIZE_WORLD;

var _colour = c_white;

var _build = false;
// NOTE Each triangle pair shares 2 verts with identical positions
// TODO West and South have horizontally flipped textures
switch(_wall){
	case __WALL.EAST:
		if (_gridY - 1 < ds_grid_width(global.world_grid)){
			_build = global.world_grid[# _gridX + 1, _gridY] == __CELL.FULL;
		}
		else{
			_build = true;
		}
		if (_build){
			// Tri 1
			vertex_position_3d(world_vbuff, _x2, _y, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x2, _y2, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x2, _y2, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
			// Tri 2
			vertex_position_3d(world_vbuff, _x2, _y, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x2, _y2, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x2, _y, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
		}
	break;
	case __WALL.NORTH:
		if (_gridY - 1 >= 0){
			_build = global.world_grid[# _gridX, _gridY - 1] == __CELL.FULL;
		}
		else{
			_build = true;
		}
		if (_build){
			// Tri 1
			vertex_position_3d(world_vbuff, _x, _y, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x2, _y, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x, _y, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
			// Tri 2
			vertex_position_3d(world_vbuff, _x2, _y, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x2, _y, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x, _y, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
		}
	break;
	case __WALL.WEST:
		if (_gridX - 1 >= 0){
			_build = global.world_grid[# _gridX - 1, _gridY] == __CELL.FULL;
		}
		else{
			_build = true;
		}
		if (_build){
			// Tri 1
			vertex_position_3d(world_vbuff, _x, _y2, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x, _y2, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x, _y, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
			// Tri 2
			vertex_position_3d(world_vbuff, _x, _y, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x, _y2, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x, _y, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
		}
	break;
	case __WALL.SOUTH:
		if (_gridY + 1 < ds_grid_height(global.world_grid)){
			_build = global.world_grid[# _gridX, _gridY + 1] == __CELL.FULL;
		}
		else{
			_build = true;
		}
		if (_build){
			// Tri 1
			vertex_position_3d(world_vbuff, _x2, _y2, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x2, _y2, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x, _y2, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
			// Tri 2
			vertex_position_3d(world_vbuff, _x, _y2, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x2, _y2, _z);
			vertex_texcoord(world_vbuff, texcoord_wall_u + texcoord_size, texcoord_wall_v + texcoord_size);
			vertex_colour(world_vbuff, _colour, 1);
			vertex_position_3d(world_vbuff, _x, _y2, _z2);
			vertex_texcoord(world_vbuff, texcoord_wall_u, texcoord_wall_v);
			vertex_colour(world_vbuff, _colour, 1);
		}
	break;
	case __WALL.FLOOR:
		// Tri 1
		vertex_position_3d(world_vbuff, _x, _y, _z); // Top Left
		vertex_texcoord(world_vbuff, texcoord_floor_u, texcoord_floor_v);
		vertex_colour(world_vbuff, _colour, 1);
		vertex_position_3d(world_vbuff, _x2, _y, _z); // Top Right
		vertex_texcoord(world_vbuff, texcoord_floor_u + texcoord_size, texcoord_floor_v);
		vertex_colour(world_vbuff, _colour, 1);
		vertex_position_3d(world_vbuff, _x2, _y2, _z); // Bot Right
		vertex_texcoord(world_vbuff, texcoord_floor_u + texcoord_size, texcoord_floor_v + texcoord_size);
		vertex_colour(world_vbuff, _colour, 1);
		// Tri 2
		vertex_position_3d(world_vbuff, _x, _y, _z); // Top Left Again
		vertex_texcoord(world_vbuff, texcoord_floor_u, texcoord_floor_v);
		vertex_colour(world_vbuff, _colour, 1);
		vertex_position_3d(world_vbuff, _x2, _y2, _z); // Bot Right Again
		vertex_texcoord(world_vbuff, texcoord_floor_u + texcoord_size, texcoord_floor_v + texcoord_size);
		vertex_colour(world_vbuff, _colour, 1);
		vertex_position_3d(world_vbuff, _x, _y2, _z); // Bot Left
		vertex_texcoord(world_vbuff, texcoord_floor_u, texcoord_floor_v + texcoord_size);
		vertex_colour(world_vbuff, _colour, 1);
	break;
	case __WALL.CEILING:
		// Tri 1
		vertex_position_3d(world_vbuff, _x, _y2, _z2);
		vertex_texcoord(world_vbuff, texcoord_ceiling_u, texcoord_ceiling_v + texcoord_size);
		vertex_colour(world_vbuff, _colour, 1);
		vertex_position_3d(world_vbuff, _x2, _y2, _z2);
		vertex_texcoord(world_vbuff, texcoord_ceiling_u + texcoord_size, texcoord_ceiling_v + texcoord_size);
		vertex_colour(world_vbuff, _colour, 1);
		vertex_position_3d(world_vbuff, _x, _y, _z2);
		vertex_texcoord(world_vbuff, texcoord_ceiling_u, texcoord_ceiling_v);
		vertex_colour(world_vbuff, _colour, 1);
		// Tri 2
		vertex_position_3d(world_vbuff, _x2, _y2, _z2);
		vertex_texcoord(world_vbuff, texcoord_ceiling_u + texcoord_size, texcoord_ceiling_v + texcoord_size);
		vertex_colour(world_vbuff, _colour, 1);
		vertex_position_3d(world_vbuff, _x2, _y, _z2);
		vertex_texcoord(world_vbuff, texcoord_ceiling_u + texcoord_size, texcoord_ceiling_v);
		vertex_colour(world_vbuff, _colour, 1);
		vertex_position_3d(world_vbuff, _x, _y, _z2);
		vertex_texcoord(world_vbuff, texcoord_ceiling_u, texcoord_ceiling_v);
		vertex_colour(world_vbuff, _colour, 1);
	break;
}