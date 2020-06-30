/// @func fPlayer_Turn
/// @desc {void} runs turning behaviour for player


if (keyboard_check_pressed(KEY_RIGHT)){
	dir -= 90; // Right...
}
if (keyboard_check_pressed(KEY_LEFT)){
	dir += 90; // Left...
}

if (dir >= 360 || dir <= -360){
	dir = 0;
}