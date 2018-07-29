/// @function scr_mvmt_moveByAngleRate(objectToMove, angle, rate, priority)
/// @description function to use when you know the X and Y rates by which you want to move an object
/// @argument {real} objectToMove The id or name of the object you want to move.
/// @argument {real} angle Movement should run at this angle
/// @argument {real} yRate Movement rate(pixels)
/// @argument {integer} Priority lower is higher priority, 0-collision, 1-abilities, 2-player controls, 3-environment

var objectToMove = argument0;
var directionToMove = argument1;
var rate = argument2;
var requestPriority = argument3;

var radians = degtorad(directionToMove)
objectToMove.direction = directionToMove

objectToMove.x = (objectToMove.x + rate) * cos(radians) 
objectToMove.y = (objectToMove.y + rate) * sin(radians)