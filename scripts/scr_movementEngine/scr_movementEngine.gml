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
var queueLength = array_length_2d( objectToMove.movementQueue, 0 );

var highestQueue = 5;// Set a low priority number so all requests coming in will have a higher priority
var directionRequest = undefined;//define the direction and speed as undefined since we dont know what they will be yet.
var distanceRequest = undefined;

for (i = 0; i = queueLength; i ++) {
	
	
	if (objectToMove.movementQueue[ i, 2 ] <= highestQueue ) { //check on each reqest to see which we are going to do. 
		directionRequest = objectToMove.movementQueue[ i, 0 ]
		distanceRequest = objectToMove.movementQueue[ i, 1 ]
		highestQueue = objectToMove.movementQueue[ i, 2 ];
	}
	

}

//Check for a collision


//if no collision, make the movement. 

//else if there was a collision AND it was at a high speed, possibly make the character bounce off that object by sumbitting a new movement request. OR if its a smaller object, make that object move. 

objectToMove.direction = directionRequest;
objectToMove.speed = distanceRequest;



//-------------------------













//KEYBOARD SIDE

if (keyboard_check(KEY_RIGHT)	scr_movementEngine( id, "direction", "distance", "Priority")
if (keyboard_check(KEY_LEFT)	scr_movementEngine( id, "direction", "distance", "Priority")
if (keyboard_check(KEY_UP)		scr_movementEngine( id, "direction", "distance", "Priority")
if (keyboard_check(KEY_DOWN)	scr_movementEngine( id, "direction", "distance", "Priority")





