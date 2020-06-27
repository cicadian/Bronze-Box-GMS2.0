if (!is_undefined(world_vbuff)){

	var _playerX = oPlayer.x;
	var _playerY = oPlayer.y;
	var _playerZ = oPlayer.z;
	var _playerSpr = oPlayer.sprite_index;
	var _playerSprW = oPlayer.sprite_width;
	var _playerSprH = oPlayer.sprite_height;
	var _playerSprOffX = oPlayer.sprite_xoffset;
	var _playerSprOffY = oPlayer.sprite_yoffset;
	var _playerDir = oPlayer.direction;
	var _camX = _playerX;
	var _camY = _playerY;
	var _camZ = _playerZ;
	var _pitch = 0;
	var _camDX = dcos(_playerDir);
	var _camDY = -dsin(_playerDir);
	
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	gpu_set_cullmode(cull_counterclockwise);
	gpu_set_tex_repeat(true);
	
	var _viewPrev = matrix_get(matrix_view);
	var _projPrev = matrix_get(matrix_projection);
	
	matrix_set(matrix_view, matrix_build_lookat(_camX, _camY, _camZ,
												_camX + _camDX, _camY + _camDY, _camZ,
												0, 0, 1));
	matrix_set(matrix_projection, matrix_build_projection_perspective_fov(90, room_width / room_height,  1, 2000));
	gpu_set_fog(true, COLOUR_FOG, FOGSTART, FOGEND);
	vertex_submit(world_vbuff, pr_trianglelist, world_texture);
	gpu_set_fog(false, COLOUR_FOG, FOGSTART, FOGEND);
	matrix_set(matrix_world, matrix_build_identity());
	matrix_set(matrix_view, _viewPrev);
	matrix_set(matrix_projection, _projPrev);
	
	gpu_set_ztestenable(false);
	gpu_set_zwriteenable(false);
	gpu_set_cullmode(cull_noculling);
	gpu_set_tex_repeat(false);
}