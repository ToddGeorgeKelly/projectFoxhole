function system_mvmt_collisionEngine() {
	// COLLISION ENGINE
#region GET ALL INFO FROM THE MOVEMENT REQUEST AND ALSO DECLARE NEEDED VARIABLES FOR THE COLLISION ENGINE.
		var object =					argument[0]
		var requestedX =				ds_grid_get(object.movementQueue,1,0 )
		var requestedY =				ds_grid_get(object.movementQueue,2,0 )
		var reqSpeed =					ds_grid_get(object.movementQueue,6,0 )
		var reqDirection =				ds_grid_get(object.movementQueue,4,0 )
		show_debug_message(  "colEng Directtion: " +string(reqDirection)  )
						
		var searchRadians =			reqDirection * (pi/180)				//---direction of where we will seatch for a collision(in radians)
		var currentX =						object.x
		var currentY =						object.y
		       								
		var leftRightSearchAngle =		45									//---the angle that the collision enging will search to the right and left to 'shift'.
		var shiftLeftRightAngle =		90
		var leftRightSearchDistance =	100					//---the distance from the object to the searching point

		var searchLeftAngle =			( reqDirection + leftRightSearchAngle ) mod 360	//---set the angle to search to the left, combine it with the search distance to get the leftXY search coordinates.
		var searchLeftRadians =			searchLeftAngle * (pi/180)
		var shiftLeftRadians =			(( reqDirection + shiftLeftRightAngle ) mod 360) * (pi/180)
	
		var searchRightAngle =			( reqDirection - leftRightSearchAngle + 360 ) mod 360	//---set the angle to search to the right, combine it with the search distance to get the rightXY search coordinates.
		var searchRightRadians =		searchRightAngle * (pi/180)
		var shiftRightRadians =			(( reqDirection - shiftLeftRightAngle + 360 ) mod 360) * (pi/180)
	
	
#endregion
	show_debug_message("COLENG SPEED: " + string(reqSpeed))
#region	SET THE SEARCH DISTANCE.
	/*var forwardSearchDistance = shiftSearchDistance
	if reqSpeed < shiftSearchDistance {
		forwardSearchDistance = 1
	}*/
#endregion
	//show_debug_message("PRECOL!!")
	//show_debug_message( "object: " + string(ds_grid_get(object.movementQueue, 0, 0)				 ) )
	//	show_debug_message( "reqX: " + string(ds_grid_get(object.movementQueue, 1, 0) ) )
	//	show_debug_message( "reqY: " + string(ds_grid_get(object.movementQueue, 2, 0) ) )
	//	show_debug_message( "prio: " + string(ds_grid_get(object.movementQueue, 3, 0) ) )
	//	show_debug_message( "direc: " + string(ds_grid_get(object.movementQueue, 4, 0) ) )
	//	show_debug_message( "distance: " + string(ds_grid_get(object.movementQueue, 5, 0) ) )
	//	show_debug_message( "speed" + string(ds_grid_get(object.movementQueue, 6, 0) ) )
	//	show_debug_message( "face? " + string(ds_grid_get(object.movementQueue, 7, 0) ) )
	//	show_debug_message( "collide? " + string(ds_grid_get(object.movementQueue, 8, 0) ) )
	

#region CHECK TO SEE IF THERE IS A COLLISION.
		for (i = 0; i < reqSpeed; i += 1) {
		
			var searchX =	round(currentX + shiftSearchDistance * cos(searchRadians))	//---Generate a point to check for a collision
			var searchY =	round(currentY + shiftSearchDistance * sin(searchRadians))
			var forwardIsFree = place_free(searchX, searchY)
	
		#region IF THE POINT ISN'T FREE, CHECK TO SEE IF WE SHOULD SHIFT TO THE RIGHT OR LEFT. IF THE SPOT IS FREE, SEARCH FURTHER AHEAD FOR COLLISIONS
				if (!forwardIsFree) {		//if there is a collision flagged

					var searchLeftX = round(currentX + leftRightSearchDistance * cos(searchLeftRadians)	)	//---Set the info to search to the left and check if its free
					var searchLeftY = round(currentY + leftRightSearchDistance * sin(searchLeftRadians))
					var leftIsFree = place_free(searchLeftX, searchLeftY)
				

					var searchRightX = round(currentX + leftRightSearchDistance * cos(searchRightRadians))		//---Set the info to search to the right and check if its free
					var searchRightY = round(currentY + leftRightSearchDistance * sin(searchRightRadians))
					var rightIsFree = place_free(searchRightX, searchRightY)
					show_debug_message("Left?: " + string(leftIsFree) + "    Right?: " + string(rightIsFree))
		
					if ( !leftIsFree && !rightIsFree ) {	//If we cant shift left or right, just stay put	
						//just set the targetxy as the current xy
						break;
					} else if ( leftIsFree && !rightIsFree ) {	//if just the left is free, shift left
						var currentX = round(currentX + shiftSpeed * cos(shiftLeftRadians))
						var currentY = round(currentY + shiftSpeed * cos(shiftLeftRadians))
						break;
					} else if ( !leftIsFree && rightIsFree ) {	//if just the right is free, shift right
						var currentX = round(currentX + shiftSpeed * cos(shiftRightRadians))
						var currentY = round(currentY + shiftSpeed * cos(shiftRightRadians))
						break;
					} else if ( leftIsFree && rightIsFree ) {	//if both are free, choose a random direction and go that way.
						var randomDirection = irandom(1);				//---in the event that both directions are free, randomly choose between left or right. 
						switch (randomDirection) {
							case 0 :	//in the case of 0 shift left
								var currentX = round(currentX + shiftSpeed * cos(shiftLeftRadians))
								var currentY = round(currentY + shiftSpeed * cos(shiftLeftRadians))
								break;
							case 1 :	//in the case of 1, shift right
								var currentX = round(currentX + shiftSpeed * cos(shiftRightRadians))
								var currentY = round(currentY + shiftSpeed * cos(shiftRightRadians)	)
								break;
						}
					}
				} else {
					var currentX = searchX			//---in the case that there is no forward collision, we will now increment our seach forward by saving our searched xy as the current/old xy
					var currentY = searchY 
				}
		#endregion	
		
		}
		//Debugging
		//show_debug_message("POSTCOL!!")
		//show_debug_message( "object: " + string(ds_grid_get(object.movementQueue, 0, 0)				 ) )
		//show_debug_message( "reqX: " + string(ds_grid_get(object.movementQueue, 1, 0) ) )
		//show_debug_message( "reqY: " + string(ds_grid_get(object.movementQueue, 2, 0) ) )
		//show_debug_message( "prio: " + string(ds_grid_get(object.movementQueue, 3, 0) ) )
		//show_debug_message( "direc: " + string(ds_grid_get(object.movementQueue, 4, 0) ) )
		//show_debug_message( "distance: " + string(ds_grid_get(object.movementQueue, 5, 0) ) )
		//show_debug_message( "speed" + string(ds_grid_get(object.movementQueue, 6, 0) ) )
		//show_debug_message( "face? " + string(ds_grid_get(object.movementQueue, 7, 0) ) )
		//show_debug_message( "collide? " + string(ds_grid_get(object.movementQueue, 8, 0) ) )
	
#endregion

#region REDEFINE THE REQUESTED X,Y COORDINATES IF THERE WAS A COLLISION.
		currentX = round(currentX)
		currentY = round(currentY)
		if ( requestedX != currentX || requestedY != currentY) {
		
			ds_grid_set(object.movementQueue, 1, 0, currentX )
			ds_grid_set(object.movementQueue, 2, 0, currentY )
		}
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





}
