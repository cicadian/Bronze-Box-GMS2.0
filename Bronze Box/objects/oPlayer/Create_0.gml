#macro MOVE_SMOOTH true

z = 20;
visible = false;

moveDistance = CELL_SIZE_WORLD;
moveTime = 30; // Time in steps to move one distance
moveStep = moveDistance / moveTime; // Pixels to move per step

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