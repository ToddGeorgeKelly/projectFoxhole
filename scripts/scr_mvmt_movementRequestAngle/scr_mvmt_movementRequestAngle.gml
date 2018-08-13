/// @description movementRequestAngle(object, xSpeed, ySpeed, _requestPriority, _faceDirection, _collisionImmune, _distance)
/// @argument0 object the ID of the object that you want to move
/// @argument1 {real} requestAngle Angle for movement
/// @argument2 {real} requestSpeed Speed of movement
/// @argument3 {integer} priority[default:0] Priority of request, lower number is higher priority
/// @argument4 {boolean} faceDirection[default:false] Should the object 'face'/'look' the direction of the requested movement
/// @argument5 {boolean} collisionImmune[default:false] Is the Object Immune to collision?
/// @argument6 {integer} numberOfSteps[default:1] Sets the priority to highest and then will move the object until the number of steps have been met.(looped movement request)

// MOVEMENT REQUEST SCRIPT
#region ARGUMENTS - data input from when this function was called
	var object = argument[0];
	var requestedDirection = argument[1];
	var requestedSpeed = argument[2];
	var requestedPriority = argument_count < 4 ? 0	 : argument[3];
	var faceDirection = argument_count	 < 5 ? false : argument[4];
	var collisionImmune = argument_count < 6 ? false : argument[5];
	var numberOfSteps = argument_count < 7 ? 1 : argument[6]
#endregion

#region CALCULATE ANGLE, NEW POSITION, AND DISTANCE
	
	var radians = requestedDirection * (pi/180)
	
	if (requestedSpeed < 0) requestedSpeed *= -1;				//---just in case the script is called with a negative number for the speed, change it to positive. 

	var requestedX = object.x + requestedSpeed * cos(radians)	//---use the xSpeed and ySpeed to caculate the position we should be ending up at, we are doing this so that diaganal movement won't be faster than horizontal or vertical movement.
	var requestedY = object.y + requestedSpeed * sin(radians)

	var requestedSpeed = sqrt( sqr(requestedX) + sqr(requestedY) )		//---using the new XY coordinates, caclulate the hypotinuse which will equal the distance that will be covered in this step, or, in otherwords, the speed of this frame/step.

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
	ds_grid_add(object.movementQueue, 3, newHeight, requestedPriority)
	ds_grid_add(object.movementQueue, 4, newHeight, requestedDirection)
	ds_grid_add(object.movementQueue, 5, newHeight, numberOfSteps)
	ds_grid_add(object.movementQueue, 6, newHeight, requestedSpeed)
	ds_grid_add(object.movementQueue, 7, newHeight, faceDirection)
	ds_grid_add(object.movementQueue, 8, newHeight, collisionImmune)
	
#endregion

