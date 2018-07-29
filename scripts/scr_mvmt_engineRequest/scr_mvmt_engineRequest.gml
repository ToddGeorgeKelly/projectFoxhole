/*
//REQUEST SUBMISSION SIDE
var objectToMove = argument0;
var directionToMove = argument1;
var distanceToMove = argument2;
var requestPriority = argument3;

var queueLength = array_length_2d( objectToMove.movementQueue, 0 );


objectToMove.movementQueue[ queueLength, 0 ] = directionToMove;
objectToMove.movementQueue[ queueLength, 1 ] = distanceToMove;
objectToMove.movementQueue[ queueLength, 2 ] = requestPriority;






//ENGINE SIDE-------------------------


//Check for a collision


//if no collision, make the movement. 

//else if there was a collision AND it was at a high speed, possibly make the character bounce off that object by sumbitting a new movement request. OR if its a smaller object, make that object move. 





//-------------------------













//KEYBOARD SIDE

if (keyboard_check(KEY_RIGHT)	scr_movementEngine( id, "direction", "distance", "Priority")
if (keyboard_check(KEY_LEFT)	scr_movementEngine( id, "direction", "distance", "Priority")
if (keyboard_check(KEY_UP)		scr_movementEngine( id, "direction", "distance", "Priority")
if (keyboard_check(KEY_DOWN)	scr_movementEngine( id, "direction", "distance", "Priority")





