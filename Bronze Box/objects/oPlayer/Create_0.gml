#macro MOVE_SMOOTH true

z = 20;
visible = false;

moveCounter = 0;
moveCounterMax = 30;
moveCounterInc = 1;

turnCounter = 0;
turnCounterMax = 20;
turnCounterInc = 1;

moving = false;
turning = false;

startX = x;
startY = y;

nextX = x;
nextY = y;

dir = 0;
startDir = dir;
nextDir = dir;