function scr_mvmt_advMovement() {
	/*moveSpeed = keyboard_check(vk_lshift) ? 4 : 4;

	//Movement
	currentLeftRight = keyboard_key == KEY_LEFT || keyboard_key == KEY_RIGHT ? keyboard_key : undefined;//check which key(RIGHT or LEFT) was most recently pressed. 
	//currentUpDown = keyboard_key == KEY_UP || keyboard_key == KEY_DOWN ? keyboard_key : undefined;//check which key(UP or DOWN) was most recently pressed. 

	//RIGHT/LEFT MOVEMENT
	if ( keyboard_check(KEY_LEFT) && keyboard_check(KEY_RIGHT) && currentLeftRight == KEY_RIGHT ) {
		direction = 0
		if ( place_free( x + collisionBuffer, y ) ) { //get the place you are at now pluse the buffer is 
			x += moveSpeed
		} else {
			y += scr_mvmt_goAroundStuff(direction, x, y, collisionBuffer)
		}

	} else if ( keyboard_check(KEY_LEFT) && keyboard_check(KEY_RIGHT) && currentLeftRight == KEY_LEFT ) {
		direction = 180
		if ( place_free( x - collisionBuffer, y ) ) {
			x -= moveSpeed
		} else {
			y += scr_mvmt_goAroundStuff(direction, x, y, collisionBuffer)
		}

	} else if ( keyboard_check(KEY_RIGHT) ) {
		direction = 0
		if ( place_free( x + collisionBuffer, y) ) {
			x += moveSpeed
		} else {
			y += scr_mvmt_goAroundStuff(direction, x, y, collisionBuffer)
		}

	} else if ( keyboard_check(KEY_LEFT) ) {
		direction = 180
		if ( place_free( x - collisionBuffer, y) ) {
			x -= moveSpeed
		} else {
			y += scr_mvmt_goAroundStuff(direction, x, y, collisionBuffer)
		}
	}



	//UP/DOWN MOVEMENT
	if ( keyboard_check(KEY_DOWN) ) {
		direction = 270
		if ( place_free( x , y + collisionBuffer) ) {
			y += moveSpeed
		} else {
			x += scr_mvmt_goAroundStuff(direction, x, y, collisionBuffer)
		}
	}

	if ( keyboard_check(KEY_UP) ) {
		direction = 90
		if ( place_free( x , y -collisionBuffer) ) {
			y -= moveSpeed
		} else {
			x += scr_mvmt_goAroundStuff(direction, x, y, collisionBuffer)
		}
	}














	
	
	
	
	
	
	



/* end scr_mvmt_advMovement */
}
