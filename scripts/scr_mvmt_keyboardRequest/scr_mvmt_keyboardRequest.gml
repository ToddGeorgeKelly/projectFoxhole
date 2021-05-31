function scr_mvmt_keyboardRequest() {
	/* MOVEMENT REQUEST: KEYBOARD : DO NOT EDIT
	This checks the keyboard controls to see what is being pressed and submits a request to go in the 
	desired direction, NOTE: This does not set the speed, only the desired direction as written with
	-1 or 1 so that it may be multiplied by the movement speed in a different script. There should be no
	real reason to come into this script and change anything, ever. 
	*/
	var requestPriority = keyboardPriority
	var leftRight = keyboard_key == KEY_LEFT || keyboard_key == KEY_RIGHT ? keyboard_key : undefined;
	var upDown = keyboard_key == KEY_UP || keyboard_key == KEY_DOWN ? keyboard_key : undefined;


	var requestHSpeed = 0;
	var requestVSpeed = 0;

	var requestSpeed = defaultMoveSpeed
	if (keyboard_check(vk_lshift)) {
		requestSpeed += defaultSprintSpeed
	} else if (keyboard_check(vk_lcontrol))	{
		requestSpeed += defaultSneakSpeed
	} 


	if ( keyboard_check(KEY_LEFT) && keyboard_check(KEY_RIGHT) && leftRight == KEY_RIGHT ) {
		//GO RIGHT
		requestHSpeed = requestSpeed
	} else if ( keyboard_check(KEY_LEFT) && keyboard_check(KEY_RIGHT) && leftRight == KEY_LEFT ) {
		//GO LEFT
		requestHSpeed = -requestSpeed
	} else if ( keyboard_check(KEY_RIGHT) ) {
		//GO RIGHT
		requestHSpeed = requestSpeed
	} else if ( keyboard_check(KEY_LEFT) ) {
		//GO LEFT
		requestHSpeed = -requestSpeed
	}

	if ( keyboard_check(KEY_UP) && keyboard_check(KEY_DOWN) && upDown == KEY_DOWN ) {
		//GO DOWN
		requestVSpeed = requestSpeed
	} else if ( keyboard_check(KEY_UP) && keyboard_check(KEY_DOWN) && upDown == KEY_UP ) {
		//GO UP
		requestVSpeed = -requestSpeed
	} else if ( keyboard_check(KEY_DOWN) ) {
		//GO DOWN
		requestVSpeed = requestSpeed
	} else if ( keyboard_check(KEY_UP) ) {
		//GO UP
		requestVSpeed = -requestSpeed
	}

	if (requestHSpeed != 0 || requestVSpeed != 0) {
		//requestHSpeed = requestHSpeed < 0 ? requestHSpeed * -1 : requestHSpeed;
		//requestVSpeed = requestVSpeed < 0 ? requestVSpeed * -1 : requestVSpeed;
		//var radians = arctan2(requestVSpeed, requestHSpeed)

		scr_mvmt_movementRequestXY( id, requestHSpeed, requestVSpeed , requestPriority, true)
	
		wantsToMove = true
		//WORKING show_debug_message( "hspeed " + string(requestHSpeed) + " vSpeed" + string(requestVSpeed) + " Pri " + string(requestPriority))

	}



}
