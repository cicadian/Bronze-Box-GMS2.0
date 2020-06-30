/// @func fPlayer_Turn_Smooth
/// @desc {void} runs smooth turning behaviour for player

var _inMotion = fPlayer_Get_InMotion();

if (!_inMotion){
	if (keyboard_check(ord("A"))){
		startDir = dir;
		nextDir = dir + 90; // Right...
		turning = true;
	}
	if (keyboard_check(ord("D"))){
		startDir = dir;
		nextDir = dir - 90; // Left...
		turning = true;
	}
}

if (turning){
	if (dir != nextDir){
		// Turn towards next dir
		var _turnCounterPercent = turnCounter / turnCounterMax;
		var _lerpDir = lerp(startDir, nextDir, _turnCounterPercent);
		dir = _lerpDir;
		turnCounter += turnCounterInc;
		// Wrap our dir
		if (dir == 360 || dir == -360){
			dir = 0;
			nextDir = 0;
		}
	}
	else{
		turning = false;
		turnCounter = 1;
	}
}