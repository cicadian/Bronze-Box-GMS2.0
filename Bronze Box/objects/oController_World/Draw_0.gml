if (!is_undefined(world_vbuff)){

	var _playerDir = oPlayer.dir;
	var _playerYaw = oPlayer.yaw;
	var _playerPitch = oPlayer.pitch;
	
	var _camX = oPlayer.x;
	var _camY = oPlayer.y;
	var _camZ = oPlayer.z;
	var _camDX = dcos(_playerDir + -_playerYaw);
	var _camDY = -dsin(_playerDir + -_playerYaw);
	var _camDZ = -dsin(_playerPitch);
	
	gpu_set_ztestenable(true);
	gpu_set_zwriteenable(true);
	gpu_set_cullmode(cull_counterclockwise);
	gpu_set_tex_repeat(true);
	
	var _viewPrev = matrix_get(matrix_view);
	var _projPrev = matrix_get(matrix_projection);
	
	matrix_set(matrix_view, matrix_build_lookat(_camX, _camY, _camZ,
												_camX + _camDX, _camY + _camDY, _camZ + _camDZ,
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