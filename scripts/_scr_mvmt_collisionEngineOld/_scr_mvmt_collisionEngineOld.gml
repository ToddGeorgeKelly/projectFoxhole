/*var currentX = x	//--store the initial xy location of the object thats moving
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
		highestPriorityRequest[0, 2] = currentX
		highestPriorityRequest[0, 3] = currentY
		break;	
	} 
	currentX = checkingX
	currentY = checkingY
}