/// @function scr_mvmt_moveByXYRate( objectToMove, xRate, yRate, priority, faceDirection(optional) )
/// @description function to use when you know the X and Y rates by which you want to move an object
/// @argument {real} objectToMove The id or name of the object you want to move.
/// @argument {real} xRate Movement rate along x axis.
/// @argument {real} yRate Movement rate along y axis.
/// @argument {integer} priority lower is higher priority, 0-collision, 1-abilities, 2-player controls, 3-environment
/// @argument {boolean} faceDirection Should this movment cause the player to face the direction the movement is sending them? Default is false.
/// @argument {boolean} isCollisionImmune Default is false
/// @argument {integer} timesToRun Default is 1


var objectToMove = argument[0];//The Object that will be moved.
var xRate = argument[1];//The xRate of movement
var yRate = argument[2];//The yRate of movement
var requestPriority = argument[3];//the priority

if (argument_count < 5)  {//set the value of the 
	var faceDirection = false
} else {
	var faceDirection = argument[4]
}

if (argument_count < 6)  {
	var isCollisionImmune = false
} else {
	var isCollisionImmune = argument[5]
}

if (argument_count < 7)  {
	var timesToRun = 1
} else {
	var timesToRun = argument[6]
	show_debug_message( string(timesToRun))
}


var radians = arctan2(yRate, xRate)
var angle = (radians * (180/pi)) * -1

var posxRate = xRate < 0 ? xRate * -1: xRate;//check to see if the x or y rate is negative
var posyRate = yRate < 0 ? yRate * -1: yRate;//I have to do this or the target x and y(the raw values below) will always be positive even when I need to go in a negative direction.

var requestedX =  round( objectToMove.x + posxRate * cos(radians) )//round those raw values and set the position of the object
var requestedY =  round( objectToMove.y + posyRate * sin(radians) )//We HAVE to round or diagonal movement will be trying to set you at like .043 of a pixel position, which isnt possible, so this makes it so diaganal movement is smooth.

var requestData = [ requestPriority, objectToMove, requestedX, requestedY, angle, faceDirection, isCollisionImmune, timesToRun, posxRate, posyRate]


//get the length of the current movement array, this number will be the x index to store this information in. We dont have to add one because an array that has 5 variables stored in it will have the first index as 0 and the last as 4.
var newSpot = array_height_2d(objectToMove.movementQueue)

for (i = 0; i < array_length_1d(requestData); i ++)	{
	
	objectToMove.movementQueue[ newSpot, i ] = requestData[i]
	
}
//show_debug_message(string(objectToMove.movementQueue))
objectToMove.wantsToMove = true
