var numberOfRequests = array_height_2d(movementQueue) //get the number of movement request that have been submitted this step(movement requests are submitted in the pre-step event)
var highestPriorityRequest = [] //declare the variable that we will story the highest priority request in.
highestPriorityRequest[0] = 9999 //set the priority super low(lower numbers are higher priority
var numberOfArguments = undefined; //declare the variable we will be story the number of arguments contained in each request(even though it will always be the same based on how things are now, that might change in the future so i made this versatile)


for (i = 0; i < numberOfRequests; i ++) { //for each request,
	numberOfArguments = array_length_2d(movementQueue, i)//get the number of aruments in the request,
	
	if (movementQueue[ i, 0 ] < highestPriorityRequest[0]) {//Then, if this request's priority is higher than the ones we have previously checked, 
		
		for (ii = 0; ii < numberOfArguments; ii ++) { //then store each indiviual value of that request's array into the 'highestPriority' array.
		
			highestPriorityRequest[ii] = movementQueue[i, ii]
		
		}
	}
}


//data formatt for the request: [ requestPriority, objectToMove, requestedX, requestedY, angle, faceDirection]
x = highestPriorityRequest[0, 2]//set the x/y of the object to the new target from the highest priority request
y = highestPriorityRequest[0, 3]


movementQueue = []//clear the movementQueue for the object
wantsToMove = false//now that the movement has been made, set the wantsToMove bool back to false so that the movement engine stops running EVERY frame.