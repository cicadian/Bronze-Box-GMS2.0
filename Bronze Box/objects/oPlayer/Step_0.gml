if (MOVE_SMOOTH){
	fPlayer_Turn_Smooth();
	fPlayer_Move_Smooth();
}
else{
	fPlayer_Turn();
	fPlayer_Move();
}

image_angle = dir;