/// @func world_build
/// @desc {void} builds the world

world_width = room_width div CELL_SIZE_WORLD;
world_height = room_height div CELL_SIZE_WORLD;
global.world_grid = ds_grid_create(world_width, world_height);
ds_grid_clear(global.world_grid, __CELL.FULL);
world_texture = choose(tex_room_0, tex_room_1);
tile_to_grid(LAYER_NAME, global.world_grid, __CELL.EMPTY);

world_vbuff = vertex_create_buffer();
vertex_begin(world_vbuff, world_format);

for (var _gridY = 0; _gridY < world_height; _gridY++){
	for (var _gridX = 0; _gridX < world_width; _gridX++){
		world_build_cell(_gridX, _gridY);
	}
}

vertex_end(world_vbuff);
vertex_freeze(world_vbuff);