/// @description movementRequestXY(object, xSpeed, ySpeed, _requestPriority, _faceDirection, _collisionImmune, _distance)
/// @argument0 object the ID of the object that you want to move
/// @argument1 {real} xSpeed Speed along X axis the object will move
/// @argument2 {real} ySpeed Speed along Y axis the object will move
/// @argument3 {integer} priority[default:0] Priority of request, lower number is higher priority
/// @argument4 {boolean} faceDirection[default:false] Should the object 'face'/'look' the direction of the requested movement
/// @argument5 {boolean} collisionImmune[default:false] Is the Object Immune to collision?
/// @argument6 {integer} distance[default:notSet] Sets the priority to highest and then will move the object until the distance has elapsed(looped movement request)

// MOVEMENT REQUEST SCRIPT
#region ARGUMENTS - data input from when this function was called
	var object = argument[0];
	var xSpeed = argument[1];
	var ySpeed = argument[2];
	var requestPriority = argument_count < 4 ? 0	 : argument[3];
	var faceDirection = argument_count	 < 5 ? false : argument[4];
	var collisionImmune = argument_count < 6 ? false : argument[5];
#endregion

#region CALCULATE ANGLE, NEW POSITION, AND DISTANCE
	var radians = arctan2(ySpeed, xSpeed)				//---use the xSpeed/ySpeed to calculate the angle in radians
	var rawAngle = radians * (180/pi)					//---take those radians and translate them into degrees
	var requestedDirection = (rawAngle + 360) mod 360	//---because the rawAngle will return in a range of -180 to positive 180, we will translate that into a range of 0-360 to make this easier moving forward. 

	if (xSpeed < 0) xSpeed *= -1;						//---if the xspeed/yspeed is negative, make it positive. This is done because if the x or y speed were negative, that negative value has already helped up determin the angle/direction we will be going, moving forward we only need the xSpeed/ySpeed variables to help determine 'distance' traveled, in which case, we will only be working in positives. 
	if (ySpeed < 0) ySpeed *= -1;

	var requestedX = object.x + xSpeed * cos(radians)	//---use the xSpeed and ySpeed to caculate the position we should be ending up at, we are doing this so that diaganal movement won't be faster than horizontal or vertical movement.
	var requestedY = object.y + ySpeed * sin(radians)
	
	var requestedSpeed = sqrt( sqr(requestedX - object.x) + sqr(requestedY - object.y) )		//---using the new XY coordinates, caclulate the hypotinuse which will equal the distance that will be covered in this step, or, in otherwords, the speed of this frame/step.
	
	if argument_count < 7 {
		var requestedDistance = requestedSpeed
	} else {
		var requestedDistance = round(argument[6] / requestedSpeed) * requestedSpeed
	}

	#endregion
//show_debug_message(  "object: " + string(object) + " x, y: " + string(requestedX) + ", " + string(requestedY) + " Direction: " + string(requestedDirection) + " requestedDistance: " + string(requestedDistance) + " Speed " + string(requestedSpeed) )
#region CREATE OR EXPAND THE SIZE OF THE MOVEMENT QUEUE TO ACCOMODATE THE NEW REQUEST DATA
	
	if !ds_exists(object.movementQueue, ds_type_grid) {		//---if the object we are moving doesnt already have a movementQueue, we are going to create one, otherwise we will just add to it. 
		
		object.movementQueue = ds_grid_create( 9, 1 )
		var newHeight = ds_grid_height(object.movementQueue) - 1
		
		
	} else {
		
		var newHeight = ds_grid_height(object.movementQueue) + 1	//---get the current height of the movementQueue to determine where we should be placing our movement request in that queue
		ds_grid_resize( object.movementQueue, 9,newHeight)	
		newHeight = ds_grid_height(object.movementQueue) - 1
		
	}
	
	
#endregion

#region STORE THE REQUEST'S DATA IN THE MOVEMENT QUEUE	
	//show_debug_message("STORING REQUEST DATA")
	ds_grid_set(object.movementQueue, 0, newHeight, object)				//---here we add all the needed information into the movementQueue for the specific object. 
	ds_grid_set(object.movementQueue, 1, newHeight, requestedX)
	ds_grid_set(object.movementQueue, 2, newHeight, requestedY)
	ds_grid_set(object.movementQueue, 3, newHeight, requestPriority)
	ds_grid_set(object.movementQueue, 4, newHeight, requestedDirection)
	ds_grid_set(object.movementQueue, 5, newHeight, requestedDistance)
	ds_grid_set(object.movementQueue, 6, newHeight, requestedSpeed)
	ds_grid_set(object.movementQueue, 7, newHeight, faceDirection)
	ds_grid_set(object.movementQueue, 8, newHeight, collisionImmune)
	//show_debug_message("DONE STORING")
	
	
	/*
	show_debug_message("SHOWING REQUEST DATA")
	show_debug_message( "object: " + string(ds_grid_get(object.movementQueue, 0, newHeight)				 ) )
	show_debug_message( "reqX: " + string(ds_grid_get(object.movementQueue, 1, newHeight) ) )
	show_debug_message( "reqY: " + string(ds_grid_get(object.movementQueue, 2, newHeight) ) )
	show_debug_message( "prio: " + string(ds_grid_get(object.movementQueue, 3, newHeight) ) )
	show_debug_message( "direc: " + string(ds_grid_get(object.movementQueue, 4, newHeight) ) )
	show_debug_message( "distance: " + string(ds_grid_get(object.movementQueue, 5, newHeight) ) )
	show_debug_message( "speed" + string(ds_grid_get(object.movementQueue, 6, newHeight) ) )
	show_debug_message( "face? " + string(ds_grid_get(object.movementQueue, 7, newHeight) ) )
	show_debug_message( "collide? " + string(ds_grid_get(object.movementQueue, 8, newHeight) ) )
	*/
	
#endregion

/* 
carx = 300
cary = 0

currentX = 300
currentY = 0

houseX = 400
houseY = 0

speed = 100
searchSpeed = 2
for ( i = 0; i < speed; i += searchSpeed) {
	searchX = currentX + maths
	searchY = currentY + maths
	is_free()
	
	if is_free() then			IF THE SPOT IS FREE, THEN SEARCH THE NEXT SPOT AND DONT END THE LOOP
		currentX = SearchX
		currentY = searchY
	else 
		if toTheRight or toTheLeft  then		IF THE SPOT ISNT FREE, AND WE CAN SHIFT, DO IT AND THEN SET THE NEW TARGETX TO THE 'CURRENTXY' AND END THE LOOP
			currentX = currentX + mathsLR
			currentY = currentY + mathsLR
		else
			currentX = currentX					IF THE SPOT ISNT FREE AND WE CANT SHIFT, THEN SET THE TARTGETXY AS THE CURRENTXY AND END THE LOOP
			currentY = currentY
		end
	end

*/




	
