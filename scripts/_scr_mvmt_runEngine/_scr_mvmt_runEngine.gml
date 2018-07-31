var numberOfRequests = array_height_2d(movementQueue) //get the number of movement request that have been submitted this step(movement requests are submitted in the pre-step event)
var highestPriorityRequest = [] //declare the variable that we will story the highest priority request in.
highestPriorityRequest[0] = 9999 //set the priority super low(lower numbers are higher priority
var numberOfArguments = undefined; //declare the variable we will be story the number of arguments contained in each request(even though it will always be the same based on how things are now, that might change in the future so i made this versatile)

//<<	PULL THE HIGHEST PRIORITY REQUEST		>>

for (i = 0; i < numberOfRequests; i ++) {	//--for each request,
	numberOfArguments = array_length_2d(movementQueue, i)	//--get the number of aruments in the request,
	
	if (movementQueue[ i, 0 ] < highestPriorityRequest[0]) {	//--then, if this request's priority is higher than the ones we have previously checked, 
		
		for (ii = 0; ii < numberOfArguments; ii ++) {	//--then store each indiviual value of that request's array into the 'highestPriority' array.
		
			highestPriorityRequest[ii] = movementQueue[i, ii]
		
		}
	}
}
//<<	UPDATE DIRECTION	>>

direction = round(highestPriorityRequest[0, 4])
if (highestPriorityRequest[0, 5]) facingDirection = direction;



//<<	COLLISION ENGINE	>>
collisionBuffer =3
if (!highestPriorityRequest[ 0, 6 ]) {
	
	var currentX = x	//--store the initial xy location of the object thats moving
	var currentY = y
	var checkingX = undefined;	//--declare the variables where we will store the xy of the position we are checking for a collision
	var checkingY = undefined;
	var xCollisionBuffer = collisionBuffer;		//--declare the 'buffer' that defines the amount of pixels we will be looking ahead for a collision
	var yCollisionBuffer = -collisionBuffer;
	var distance = round(sqrt( sqr(highestPriorityRequest[0, 8]) + sqr(highestPriorityRequest[0, 9])  ))	//--calculate the distance we will be going. I think this is wrong? but it also works....soooo...

	for (i = 0; i < distance ; i ++) {		//for until the index is equal to the distance we are going, check for a collision 
	
		checkingX = round(currentX + xCollisionBuffer * cos(degtorad(highestPriorityRequest[0, 4])) )
		checkingY = round(currentY + yCollisionBuffer * sin(degtorad(highestPriorityRequest[0, 4])) )

		if ( !place_free( checkingX , checkingY ) ) {
			var coneReach = 9
			var shift = 0
			//A -| -| - |- |- |- |- XX- |- |-| -| B
			var leftRadians = (direction + 90) * pi/180
			var leftConeX = checkingX + coneReach * cos(leftRadians)
			var leftConeY = checkingY + coneReach * sin(leftRadians)
			
			var rightRadians = (direction - 90) * pi/180
			var rightConeX = checkingX + coneReach * cos(rightRadians)
			var rightConeY = checkingY + coneReach * sin(rightRadians)
			/*
							X
							|
			A----------------X B
							|
							X
			
			
			*/
			if (!place_free(leftConeX, leftConeY)) {
				currentX = currentX + shift * cos(leftRadians)
				currentY = currentY + shift * sin(leftRadians)
			}
			if (!place_free(rightConeX, rightConeY)) {
				currentX = currentX + shift * cos(rightRadians)
				currentY = currentY + shift * sin(rightRadians)
			}
			highestPriorityRequest[0, 2] = currentX
			highestPriorityRequest[0, 3] = currentY
			break;	
		} 
		currentX = checkingX
		currentY = checkingY
	}
	
	//based on the collision, this is the next location we should be at
	
	
}




//<<	COMMIT THE MOVEMENT XY		>>
//--	data formatt for the request: [ 0-requestPriority, 1-objectToMove, 2-requestedX, 3-requestedY, 4-angle, 5-faceDirection, 6-isCollisionImmune, 7-timesToRun, 8-xRate, 9-yRate]
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