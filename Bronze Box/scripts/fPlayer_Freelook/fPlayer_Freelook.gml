/// @func 
/// @desc {type} runs freelook mouse aiming for the player, clamped to a cone
/// @arg {type}

#macro FREELOOK_RADIUS 60 // 120 degree angle on view cone

var _press_aim = mouse_check_button_pressed(mb_right);
var _hold_aim = mouse_check_button(mb_right);
var _release_aim = mouse_check_button_released(mb_right);

if (_press_aim){
	yawStart = mouse_x - GAME_WIDTH_FULL_CENTER;
	pitchStart = mouse_y - GAME_HEIGHT_FULL_CENTER;
	window_set_cursor(cr_none);
}
if (_hold_aim){
	var _tempPointX = clamp(mouse_x - yawStart, 0, GAME_WIDTH_FULL);
	var _tempPointY = clamp(mouse_y - pitchStart, 0, GAME_HEIGHT_FULL);
	yaw = range_convert(0, GAME_WIDTH_FULL, -FREELOOK_RADIUS, FREELOOK_RADIUS, _tempPointX);
	pitch = range_convert(0, GAME_HEIGHT_FULL, -FREELOOK_RADIUS, FREELOOK_RADIUS, _tempPointY);
}
if (_release_aim){
	window_set_cursor(cr_default);
	var _returnX = yawStart + GAME_WIDTH_FULL_CENTER;
	var _returnY = pitchStart + GAME_HEIGHT_FULL_CENTER;
	window_mouse_set(_returnX, _returnY);
	resetAim = true;
}

if (resetAim){
	if (yaw != 0 && pitch != 0){
		var _aimCounterPercent = aimCounter / aimCounterMax;
		yaw = lerp(yaw, 0, _aimCounterPercent);
		pitch = lerp(pitch, 0, _aimCounterPercent);
		aimCounter += aimCounterInc;
	}
	else{
		resetAim = false;
		aimCounter = 0;
	}
}