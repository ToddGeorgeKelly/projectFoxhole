var numberOfRequests = array_height_2d(movementQueue) //get the number of movement request that have been submitted this step(movement requests are submitted in the pre-step event)
var highestPriorityRequest = [] //declare the variable that we will story the highest priority request in.
highestPriorityRequest[0] = 9999 //set the priority super low(lower numbers are higher priority
var numberOfArguments = undefined; //declare the variable we will be story the number of arguments contained in each request(even though it will always be the same based on how things are now, that might change in the future so i made this versatile)

//PULL THE HIGHESTS PRIORITY REQUEST
for (i = 0; i < numberOfRequests; i ++) { //for each request,
	numberOfArguments = array_length_2d(movementQueue, i)//get the number of aruments in the request,
	
	if (movementQueue[ i, 0 ] < highestPriorityRequest[0]) {//Then, if this request's priority is higher than the ones we have previously checked, 
		
		for (ii = 0; ii < numberOfArguments; ii ++) { //then store each indiviual value of that request's array into the 'highestPriority' array.
		
			highestPriorityRequest[ii] = movementQueue[i, ii]
		
		}
	}
}
show_debug_message("PreCollision: " + string(highestPriorityRequest))

//collision

if (!highestPriorityRequest[ 0, 6 ]) {
	
	var collisionXRate = undefined;
	var collisionYRate = undefined;
	
	switch( sign( highestPriorityRequest[0, 8] ) ) {
	
		case -1: collisionXRate = -collisionBuffer; break;
			
		case 0: collisionXRate = 0;	break;
			
		case 1:	collisionXRate = collisionBuffer; break;
	}
	switch( sign( highestPriorityRequest[0, 9] ) ) {
	
		case -1: collisionYRate = -collisionBuffer; break;
			
		case 0: collisionYRate = 0;	break;
			
		case 1:	collisionYRate = collisionBuffer; break;
	}
		
	var oldX = x
	var oldY = y
	var newX = x
	var newY = y
	
	
	var rate = highestPriorityRequest[ 0, 8] > highestPriorityRequest[0, 9] ? highestPriorityRequest[ 0, 8] : highestPriorityRequest[0, 9];
	
	for (i = 0; i < rate; i ++) {
		newX = oldX + collisionXRate * cos(degtorad(highestPriorityRequest[0, 4])) 
		newY = oldY + collisionYRate * sin(degtorad(highestPriorityRequest[0, 4])) 

		if ( !place_free( newX , newY ) ) {
			highestPriorityRequest[0, 2] = oldX
			highestPriorityRequest[0, 3] = oldY
			rate=rate 
		
		} 
	}
	
}
show_debug_message("Post Collision: " + string(highestPriorityRequest))

//UPDATE DIRECTION
direction = round(highestPriorityRequest[0, 4])
if (highestPriorityRequest[0, 5]) facingDirection = direction;


//MAKE THE MOVEMENT
//data formatt for the request: [ 0-requestPriority, 1-objectToMove, 2-requestedX, 3-requestedY, 4-angle, 5-faceDirection, 6-isCollisionImmune, 7-timesToRun, 8-xRate, 9-yRate]
x = highestPriorityRequest[0, 2]//set the x/y of the object to the new target from the highest priority request
y = highestPriorityRequest[0, 3]


//POST MOVEMENT MANAGEMENT
//for looping movement requests
if (highestPriorityRequest[ 0, 7 ] > 1)	{
	highestPriorityRequest[ 0, 2 ] += highestPriorityRequest[ 0, 8 ]//add the xRate to the request
	highestPriorityRequest[ 0, 3 ] += highestPriorityRequest[ 0, 9 ]
	show_debug_message("Engine Running: array is: " + string(highestPriorityRequest))
	highestPriorityRequest[ 0, 7 ] --;
	loopingRequest = highestPriorityRequest;
	wantsToMove = true;
}else{
	loopingRequest = undefined;
	wantsToMove = false;//now that the movement has been made, set the wantsToMove bool back to false so that the movement engine stops running EVERY frame.
}



movementQueue = []//clear the movementQueue for the object