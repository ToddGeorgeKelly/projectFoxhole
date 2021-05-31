/// @function scr_mvmt_moveByAngleRate(objectToMove, angle, rate, priority)
/// @description function to use when you know the X and Y rates by which you want to move an object
/// @argument {real} objectToMove The id or name of the object you want to move.
/// @argument {real} angle Movement should run at this angle
/// @argument {real} yRate Movement rate(pixels)
/// @argument {integer} Priority lower is higher priority, 0-collision, 1-abilities, 2-player controls, 3-environment
/// @argument {boolean} faceDirection(defaultFalse) Should this movment cause the player to face the direction the movement is sending them? Default is false.
/// @argument {boolean} isCollisionImmune(defaultFalse)
/// @argument {integer} timesToRun(default1)
function scr_mvmt_moveByAngleRateOld() {
	/*

	var objectToMove = argument[0];
	var angle = argument[1];
	var xRate = argument[2];
	var yRate = argument[2];
	var requestPriority = argument[3];

	if (argument_count < 5)  {
		var faceDirection = false
	} else {
		var faceDirection = argument[4]
	}

	if (argument_count < 6)  {
		var isCollisionImmune = false
	} else {
		var isCollisionImmune = argument[5]
	}

	if (argument_count < 7)  {
		var timesToRun = 1
	} else {
		var timesToRun = argument[6]
	}



	var radians = degtorad(angle)
	//I think the rate is wrong here, I think i amy
	var requestedX = round(objectToMove.x + xRate * cos(radians) )
	var requestedY = round(objectToMove.y + yRate * sin(radians))

	var requestData = [ requestPriority, objectToMove, requestedX, requestedY, angle, faceDirection, isCollisionImmune, timesToRun, xRate, yRate]

	//get the length of the current movement array, this number will be the x index to store this information in. We dont have to add one because an array that has 5 variables stored in it will have the first index as 0 and the last as 4.
	var newSpot = array_height_2d(objectToMove.movementQueue)

	for (i = 0; i < array_length_1d(requestData); i ++)	{
	
		objectToMove.movementQueue[ newSpot, i ] = requestData[i]
	
	}
	show_debug_message(string(objectToMove.movementQueue))
	objectToMove.wantsToMove = true

	





/* end scr_mvmt_moveByAngleRateOld */
}
