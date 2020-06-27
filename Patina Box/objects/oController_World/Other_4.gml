var _width = room_width div CELL_SIZE_WORLD;
var _height = room_height div CELL_SIZE_WORLD;
global.world_grid = ds_grid_create(_width, _height);
ds_grid_clear(global.world_grid, __CELL.FULL);

tile_to_grid(LAYER_NAME, global.world_grid, __CELL.EMPTY);
var _layer = layer_get_id(LAYER_NAME);
layer_set_visible(_layer, false);

world_vbuff = vertex_create_buffer();
vertex_begin(world_vbuff, world_format);

for (var _gridY = 0; _gridY < _height; _gridY++){
	for (var _gridX = 0; _gridX < _width; _gridX++){
		world_build_cell(_gridX, _gridY);
	}
}

vertex_end(world_vbuff);
vertex_freeze(world_vbuff);