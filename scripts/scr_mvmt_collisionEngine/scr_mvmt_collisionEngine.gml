// COLLISION ENGINE
#region GET ALL INFO FROM THE MOVEMENT REQUEST AND ALSO DECLARE NEEDED VARIABLES FOR THE COLLISION ENGINE.
	var object =					ds_grid_get(object.movementQueue,0,0 )
	var requestedX =				ds_grid_get(object.movementQueue,1,0 )
	var requestedY =				ds_grid_get(object.movementQueue,2,0 )
	var requestedDistance =			ds_grid_get(object.movementQueue,5,0 )
	var requestedSpeed =			ds_grid_get(object.movementQueue,6,0 )
	var requestedDirection =		ds_grid_get(object.movementQueue,4,0 )
									
	var forwardRadians =			requestedDirection * (pi/180)
	var oldX =						object.x
	var oldY =						object.y
	
	var shiftSpeed =				2								//---the speed at which the object with 'shift' when encountering a corner or slanted surface. 
	var leftRightSearchAngle =		45								//---the angle that the collision enging will search to the right and left to 'shift'.
	var shiftLeftRightAngle =		90
	var leftRightSearchDistance =	requestedSpeed * 2				//---the distance from the object to the searching point

	var searchLeftAngle =			( requestedDirection + leftRightSearchAngle ) mod 360	//---set the angle to search to the left, combine it with the search distance to get the leftXY search coordinates.
	var searchLeftRadians =			searchLeftAngle * (pi/180)
	var shiftLeftRadians =			(( requestedDirection + shiftLeftRightAngle ) mod 360) * (pi/180)
	
	var searchRightAngle =			( requestedDirection - leftRightSearchAngle + 360 ) mod 360	//---set the angle to search to the right, combine it with the search distance to get the rightXY search coordinates.
	var searchRightRadians =		searchRightAngle * (pi/180)
	var shiftRightRadians =			(( requestedDirection - shiftLeftRightAngle + 360 ) mod 360) * (pi/180)
	
	
#endregion

#region	SET THE SEARCH DISTANCE.
var forwardSearchDistance = 5
if requestedSpeed < forwardSearchDistance {
	forwardSearchDistance = 2
}
#endregion

#region CHECK TO SEE IF THERE IS A COLLISION.
	for (i = 0; i < requestedSpeed; i += forwardSearchDistance) {
		
		var forwardX =	oldX + forwardSearchDistance * cos(forwardRadians)
		var forwardY =	oldY + forwardSearchDistance * sin(leftRadians)
		var forwardIsFree = place_free(forwardX, forwardY)
	
		#region IF THE FORWARD SPOT ISN'T FREE, CHECK TO SEE IF WE SHOULD SHIFT TO THE RIGHT OR LEFT. IF THE SPOT IS FREE, SEARCH FURTHER AHEAD FOR COLLISIONS
			if (!forwardIsFree) {
				var oldX = forwardX
				var oldY = forwardY
				var searchLeftX = forwardX + leftRightSearchDistance * cos(leftRadians)
				var searchLeftY = forwardX + leftRightSearchDistance * sin(leftRadians)
				var leftIsFree = place_free(searchLeftX, searchLeftY)

				var searchRightX = forwardX + leftRightSearchDistance * cos(rightRadians)
				var searchRightY = forwardX + leftRightSearchDistance * sin(rightRadians)
				var rightIsFree = place_free(searchRightX, searchRightY)
		
				if ( !leftIsFree && !rightIsFree ) {				//---since we have a collision, decide if we are shifting and which direction we are going to shift based on which is free
					var gotoX = oldX
					var gotoY = oldY
					break;
				} else if ( leftIsFree && !rightIsFree ) {
					var gotoX = oldX + shiftSpeed * cos(shiftLeftRadians)
					var gotoY = oldY + shiftSpeed * cos(shiftLeftRadians)
				} else if ( !leftIsFree && rightIsFree ) {
					var gotoX = oldX + shiftSpeed * cos(shiftRightRadians)
					var gotoY = oldY + shiftSpeed * cos(shiftRightRadians)
				} else if ( leftIsFree && rightIsFree ) {
					var randomDirection = irandom(1);				//---in the event that both directions are free, randomly choose between left or right. 
					switch (randomDirection) {
						case 0 : 
							var gotoX = oldX + shiftSpeed * cos(shiftLeftRadians)
							var gotoY = oldY + shiftSpeed * cos(shiftLeftRadians)
						case 1 : 
							var gotoX = oldX + shiftSpeed * cos(shiftRightRadians)
							var gotoY = oldY + shiftSpeed * cos(shiftRightRadians)	
					}
				}
		
			} else {
				var oldX = forwardX			//---in the case that there is no forward collision, we will now increment our seach forward by saving our searched xy as the current/old xy
				var oldY = forwardY 
				var gotoX = forwardX
				var gotoY = forwardY
			}
		#endregion	
		
	}
#endregion

#region REDEFINE THE REQUESTED X,Y COORDINATES IF THERE WAS A COLLISION.
	if ( requestedX != gotoX || requestedY != gotoY) {
		ds_grid_set(object.movementQueue, 1, 0, gotoX )
		ds_grid_set(object.movementQueue, 2, 0, gotoY )
	}
#endregion



