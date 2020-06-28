#region Macros
#macro LAYER_NAME "cells" // name of the layer we paint our maps on
#macro CELL_SIZE_WORLD 32 // size of the cells in world space
#macro FOGSTART CELL_SIZE_WORLD // where render fog starts
#macro FOGEND CELL_SIZE_WORLD * 5 // .. ends
#macro COLOUR_FOG c_black // colour of the render fog
#endregion

#region Enums
enum __CELL{ // used to quickly reference map cells
	FULL, // this is a wall
	EMPTY // this is walkable space
}

enum __WALL{ // used to quickly reference the sides(faces/walls) of our world cells
	EAST,
	NORTH,
	WEST,
	SOUTH,
	
	FLOOR,
	CEILING,
	
	SIZE // used to get how long this enum is
}
#endregion

#region Init
world_format = undefined;
world_vbuff = undefined;
world_width = undefined;
world_height = undefined;
world_texture = undefined;
global.world_grid = undefined;

var _layer = layer_get_id(LAYER_NAME);
layer_set_visible(_layer, false);
#endregion

#region Vertex Format
/*
 A vertex format determines how the vertex buffer is built and interpreted by the renderer.
*/
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_texcoord();
vertex_format_add_colour();
world_format = vertex_format_end();
#endregion

#region Texture Coordinates
tex_room_0 = sprite_get_texture(sDungeon, 0);
tex_room_1 = sprite_get_texture(sDungeon, 1);

texcoord_size = 0.5; // normalised space our sprites take up on our texture
texcoord_wall_u = 0.5;
texcoord_wall_v = 0;
texcoord_floor_u = 0.5;
texcoord_floor_v = 0.5;
texcoord_ceiling_u = 0;
texcoord_ceiling_v = 0;
#endregion