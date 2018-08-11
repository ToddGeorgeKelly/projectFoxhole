// MOVEMENT REQUEST SCRIPT
#region ARGUMENTS - data input from when this function was called
	var object = argument[0]
	var xSpeed = argument[1]
	var ySpeed = argument[2]
	var requestPriority = argument[3]
	var faceDirection = argument[4]
	var collisionImmune = argument[5]
	
#endregion

#region CALCULATE ANGLE, NEW POSITION, AND DISTANCE
	var radians = arctan2(ySpeed, xSpeed)				//---use the xSpeed/ySpeed to calculate the angle in radians
	var rawAngle = radians * (180/pi)					//---take those radians and translate them into degrees
	var requestedDirection = (rawAngle + 360) mod 360	//---because the rawAngle will return in a range of -180 to positive 180, we will translate that into a range of 0-360 to make this easier moving forward. 

	if (xSpeed < 0) xSpeed *= -1;						//---if the xspeed/yspeed is negative, make it positive. This is done because if the x or y speed were negative, that negative value has already helped up determin the angle/direction we will be going, moving forward we only need the xSpeed/ySpeed variables to help determine 'distance' traveled, in which case, we will only be working in positives. 
	if (ySpeed < 0) ySpeed *= -1;

	var requestedX = object.x + xSpeed * cos(radians)	//---use the xSpeed and ySpeed to caculate the position we should be ending up at, we are doing this so that diaganal movement won't be faster than horizontal or vertical movement.
	var requestedY = object.y + ySpeed * sin(radians)

	var requestedSpeed = sqrt( sqr(requestedX) + sqr(requestedY) )		//---using the new XY coordinates, caclulate the hypotinuse which will equal the distance that will be covered in this step, or, in otherwords, the speed of this frame/step.
	var requestedDistance = round(requestedDistance / requestedSpeed) * requestedSpeed
	if argument_count < 6 {
		var requestedDistance = requestedSpeed
	} else {
		var requestedDistance = round(requestedDistance / requestedSpeed) * requestedSpeed
	}
	#endregion

#region CREATE OR EXPAND THE SIZE OF THE MOVEMENT QUEUE TO ACCOMODATE THE NEW REQUEST DATA
	if (!ds_exists(object.movementQueue, grid)) {		//---if the object we are moving doesnt already have a movementQueue, we are going to create one, otherwise we will just add to it. 
	
		object.movementQueue = ds_grid_create(1, 9 )
	} else {
		var newHeight = ds_grid_height(object.movementQueue)			//---get the current height of the movementQueue to determine where we should be placing our movement request in that queue
		ds_grid_resize( object.movementQueue, 9,newHeight)						
	}
#endregion

#region STORE THE REQUEST'S DATA IN THE MOVEMENT QUEUE
	ds_grid_add(object.movementQueue, 0, newHeight, object)				//---here we add all the needed information into the movementQueue for the specific object. 
	ds_grid_add(object.movementQueue, 1, newHeight, requestedX)
	ds_grid_add(object.movementQueue, 2, newHeight, requestedY)
	ds_grid_add(object.movementQueue, 3, newHeight, requestPriority)
	ds_grid_add(object.movementQueue, 4, newHeight, requestedDirection)
	ds_grid_add(object.movementQueue, 5, newHeight, requestedDistance)
	ds_grid_add(object.movementQueue, 6, newHeight, requestedSpeed)
	ds_grid_add(object.movementQueue, 7, newHeight, faceDirection)
	ds_grid_add(object.movementQueue, 8, newHeight, collisionImmune)
	
#endregion






	
