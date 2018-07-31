//<<	COLLISION ENGINE	>>
collisionBuffer =3
if (!highestPriorityRequest[ 0, 6 ]) {
	
	var currentX = x	//--store the initial xy location of the object thats moving
	var currentY = y
	var checkingX = undefined;	//--declare the variables where we will store the xy of the position we are checking for a collision
	var checkingY = undefined;
	var xCollisionBuffer = collisionBuffer;		//--declare the 'buffer' that defines the amount of pixels we will be looking ahead for a collision
	var yCollisionBuffer = -collisionBuffer;
	var distance = round(sqrt( highestPriorityRequest[0, 8] + highestPriorityRequest[0, 9]  ))	//--calculate the distance we will be going. I think this is wrong? but it also works....soooo...

	for (i = 0; i < distance ; i ++) {		//for until the index is equal to the distance we are going, check for a collision 
	
		checkingX = round(currentX + xCollisionBuffer * cos(degtorad(highestPriorityRequest[0, 4])) )
		checkingY = round(currentY + yCollisionBuffer * sin(degtorad(highestPriorityRequest[0, 4])) )

		if ( !place_free( checkingX , checkingY ) ) {
			var coneReach = 9
			var shift = 0
			var leftRadians = (direction + 90) * pi/180
			var rightRadians = (direction - 90) * pi/180
			
			var leftConeX = checkingX + coneReach * cos(leftRadians)
			var leftConeY = checkingY + coneReach * sin(leftRadians)
			
			var rightConeX = checkingX + coneReach * cos(rightRadians)
			var rightConeY = checkingY + coneReach * sin(rightRadians)
			
			if (!place_free(leftConeX, leftConeY)) {
				show_debug_message("LEFT IS NOT FREE!")
				currentX = currentX + shift * cos(leftRadians)
				currentY = currentY + shift * sin(leftRadians)
			}
			if (!place_free(rightConeX, rightConeY)) {
				show_debug_message("RIGHT IS NOT FREE!")
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