/// @function scr_mvmt_moveByXYRate(objectToMove, xRate, yRate, priority)
/// @description function to use when you know the X and Y rates by which you want to move an object
/// @argument {real} objectToMove The id or name of the object you want to move.
/// @argument {real} xRate Movement rate along x axis.
/// @argument {real} yRate Movement rate along y axis.
/// @argument {integer} Priority lower is higher priority, 0-collision, 1-abilities, 2-player controls, 3-environment

var objToMove = argument0;//The Object that will be moved.

var xRate = argument1;//The xRate of movement
var yRate = argument2;//The yRate of movement

var requestPriority = argument3;//the priority

var radians = arctan2(yRate, xRate)//This will take the x and y rates to give an angle in radians
var rawDegrees = radians * (180/pi) //taking that radian and turing it into an degree angle
var correctedDegrees = rawDegrees * -1
objToMove.direction = correctedDegrees


if (xRate < 0) xRate *= -1;//check to see if the x or y rate is negative
if (yRate < 0) yRate *= -1;//I have to do this or the target x and y(the raw values below) will always be positive even when I need to go in a negative direction.


var rawX = objToMove.x + xRate * cos(radians)//get the non integer value of the x and y coordinates we want to be at.
var rawY = objToMove.y + yRate * sin(radians)
objToMove.x =  round(rawX)//round those raw values and set the position of the object
objToMove.y =  round(rawY)//We HAVE to round or diagonal movement will be trying to set you at like .043 of a pixel position, which isnt possible, so this makes it so diaganal movement is smooth.

