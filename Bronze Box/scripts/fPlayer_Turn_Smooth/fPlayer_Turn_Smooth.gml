/// @func fPlayer_Turn_Smooth
/// @desc {void} runs smooth turning behaviour for player

var _inMotion = fPlayer_Get_InMotion();

if (!_inMotion){
	if (keyboard_check(KEY_RIGHT)){
		startDir = dir;
		nextDir = dir - 90; // Right...
		turning = true;
	}
	if (keyboard_check(KEY_LEFT)){
		startDir = dir;
		nextDir = dir + 90; // Left...
		turning = true;
	}
}

var _goAgain = false;

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
		_goAgain = keyboard_check(KEY_RIGHT) || keyboard_check(KEY_LEFT);
		turning = false;
		turnCounter = 1;
	}
}

#region Remove 1 frame pause when turning to next dir while holding

if (_goAgain){
	if (keyboard_check(KEY_RIGHT)){
		startDir = dir;
		nextDir = dir - 90; // Right...
		turning = true;
	}
	if (keyboard_check(KEY_LEFT)){
		startDir = dir;
		nextDir = dir + 90; // Left...
		turning = true;
	}
	
	if (x != nextX || y != nextY){
		// Turn towards next dir
		var _turnCounterPercent = turnCounter / turnCounterMax;
		dir = lerp(startDir, nextDir, _turnCounterPercent);
		turnCounter += turnCounterInc;
		// Wrap our dir
		if (dir == 360 || dir == -360){
			dir = 0;
			nextDir = 0;
		}
	}
	
}

#endregion