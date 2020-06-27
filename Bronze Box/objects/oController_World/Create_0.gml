world_format = undefined;
world_vbuff = undefined;
global.world_grid = undefined;

vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_colour();
world_format = vertex_format_end();

tex_world = sprite_get_texture(sDungeon, 0);

texcoord_size = 0.5; // normalized space our sprites take up on our texture
texcoord_wall_u = 0.5;
texcoord_wall_v = 0;
texcoord_floor_u = 0.5;
texcoord_floor_v = 0.5;
texcoord_ceiling_u = 0;
texcoord_ceiling_v = 0;

#macro CELL_SIZE_GUI 32
#macro CELL_SIZE_WORLD 32
#macro FOGSTART CELL_SIZE_WORLD
#macro FOGEND CELL_SIZE_WORLD * 5
#macro LAYER_NAME "cells"
#macro COLOUR_FOG c_black
enum __CELL{
	FULL,
	EMPTY
}

enum __WALL{
	EAST,
	NORTH,
	WEST,
	SOUTH,
	
	FLOOR, // Floor is protected
	CEILING,
	
	SIZE
}