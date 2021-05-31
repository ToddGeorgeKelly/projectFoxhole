function system_mvmt_movementEngine() {
	//MOVEMENT ENGINE
#region SORT REQUESTS BY PRIORITY AND GET DATA FROM THE HIGHEST PRIORITY REQUEST
	
		var object =				id
		show_debug_message( "ENGINE " + string( ds_grid_get(object.movementQueue,4,0 ) ) )
		ds_grid_sort(object.movementQueue, 3, true)		//---sort the ds_grid by the requestPriority, lower number is higher priority.
		var requestedX =			ds_grid_get(object.movementQueue,1,0 );
		var requestedY =			ds_grid_get(object.movementQueue,2,0 );
		var requestPriority =		ds_grid_get(object.movementQueue,3,0 );
		var requestedDirection =	ds_grid_get(object.movementQueue,4,0 );
		var requestedDistance =		ds_grid_get(object.movementQueue,5,0 );
		var requestedSpeed =		ds_grid_get(object.movementQueue,6,0 );
		var faceDirection =			ds_grid_get(object.movementQueue,7,0 );
		var collisionImmune =		ds_grid_get(object.movementQueue,8,0 );
#endregion

#region SET 'MOVEMENT' DIRECTION AND 'FACING' DIRECTION
		if direction != requestedDirection {			//---if the 'movement' direction has changed from last time, update it.
			direction = round(requestedDirection);
		}
		if faceDirection {
			object.facingDirection = direction	;		//---if the request wants the sprite to face the same direction as the 'movement' in this request, update it. 
		}
#endregion

#region CHECK FOR COLLISIONS ON WAY TO REQUESTED X/Y AND, IF APPLICABLE, STOP MOVEMENT OR PROVIDE A NEW X/Y TO MOVE TO.

	show_debug_message("PRE-COLENG SPEED: " + string(requestedSpeed))
	system_mvmt_collisionEngine(object);
	show_debug_message("POST-COLENG SPEED: " + string(requestedSpeed))
	/*I have built a collision engine that suits my purposes, but if you have one that you want to use, all you have to do is:
		-insert the code in this section
		-make sure that at the end of the code, it updates the movement request's XY coordinates with ds_grid_set() like so:
			ds_grid_set(object.movementQueue, 1, 0, gotoX ) -this will update the x request with the value of gotoX
			ds_grid_set(object.movementQueue, 2, 0, gotoY ) -this will update the y request with the value of gotoY
	*/

#endregion

#region GATHER THE VALUE OF THE XY REQUEST AGAIN FROM THE MOVEMENT QUEUE AND SET THE OBJECT'S XY TO IT
		committedX = round(ds_grid_get(object.movementQueue,1,0 ));
		committedY = round(ds_grid_get(object.movementQueue,2,0 ));

		object.x = committedX;
		object.y = committedY;
	
		ds_grid_destroy(object.movementQueue)
#endregion



}
