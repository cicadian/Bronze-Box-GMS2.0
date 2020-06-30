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

// yaw and pitch here are interchanble with [x,y] however it is better to think in terms of rotation
yaw = 0;
yawStart = 0;
pitch = 0;
pitchStart = 0;

// counter used to lerp yaw and pitch to 0 when ending freelook
aimCounter = 0;
aimCounterMax = 20;
aimCounterInc = 1;

resetAim = false;