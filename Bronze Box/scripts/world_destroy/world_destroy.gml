/// @func world_destroy
/// @desc {void} destroys the world

world_width = undefined;
world_height = undefined

vertex_delete_buffer(world_vbuff);
world_vbuff = undefined;

ds_grid_destroy(global.world_grid);

world_texture = undefined;