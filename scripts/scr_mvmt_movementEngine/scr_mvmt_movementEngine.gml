//MOVEMENT ENGINE
#region SORT REQUESTS BY PRIORITY AND GET DATA FROM THE HIGHEST PRIORITY REQUEST
	ds_grid_sort(object.movementQueue, 4, true)		//---sort the ds_grid by the requestPriority, lower number is higher priority.
	var object =				ds_grid_get(object.movementQueue,0,0 )
	var requestedX =			ds_grid_get(object.movementQueue,1,0 )
	var requestedY =			ds_grid_get(object.movementQueue,2,0 )
	var requestPriority =		ds_grid_get(object.movementQueue,3,0 )
	var requestedDirection =	ds_grid_get(object.movementQueue,4,0 )
	var requestedDistance =		ds_grid_get(object.movementQueue,5,0 )
	var requestedSpeed =		ds_grid_get(object.movementQueue,6,0 )
	var faceDirection =			ds_grid_get(object.movementQueue,7,0 )
	var collisionImmune =		ds_grid_get(object.movementQueue,8,0 )
#endregion

#region SET 'MOVEMENT' DIRECTION AND 'FACING' DIRECTION
	if direction != requestedDirection {			//---if the 'movement' direction has changed from last time, update it.
		direction = requestedDirection
	}
	if faceDirection {
		object.facingDirection = direction			//---if the request wants the sprite to face the same direction as the 'movement' in this request, update it. 
	}
#endregion

#region CHECK FOR COLLISIONS ON WAY TO REQUESTED X/Y AND, IF APPLICABLE, STOP MOVEMENT OR PROVIDE A NEW X/Y TO MOVE TO.



//I have built a collision engine that suits my purposes, but this movement engine is compatible with other collision engines so long as those engines return what x/y coordinate the object is suppsed to move to as an alternative to the 'requestedX' and 'requestedY'.

#endregion

#region GATHER THE VALUE OF THE XY REQUEST AGAIN FROM THE MOVEMENT QUEUE AND SET THE OBJECT'S XY TO IT
	committedX = ds_grid_get(object.movementQueue,1,0 )
	committedY = ds_grid_get(object.movementQueue,2,0 )

	object.x = committedX
	object.y = committedY
#endregion
