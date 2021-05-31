function oldMovement() {
	/*moveSpeed = keyboard_check(vk_lshift) ? 4 : 4;

	//Movement
	currentLeftRight = keyboard_key == KEY_LEFT || keyboard_key == KEY_RIGHT ? keyboard_key : undefined;//check which key(RIGHT or LEFT) was most recently pressed. 
	//currentUpDown = keyboard_key == KEY_UP || keyboard_key == KEY_DOWN ? keyboard_key : undefined;//check which key(UP or DOWN) was most recently pressed. 

	//RIGHT/LEFT MOVEMENT
	if ( keyboard_check(KEY_LEFT) && keyboard_check(KEY_RIGHT) && currentLeftRight == KEY_RIGHT ) {
		direction = 0
		if ( place_free( x + collisionBuffer, y ) ) {
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




	//SPRITE DETERMINATION
	switch (direction)	{

		case 0:
			sprite_index = keyboard_check(KEY_RIGHT)? walkRight : standRight;
			break;
	
		case 90:
			sprite_index = keyboard_check(KEY_UP) ? walkUp : standUp;
			break;
	
		case 180:
			sprite_index = keyboard_check(KEY_LEFT) ? walkLeft : standLeft;
			break;
		
		case 270:
			sprite_index = keyboard_check(KEY_DOWN) ? walkDown : standDown;
			break;

	}

	sprite_set_speed(sprite_index, moveSpeed+2, spritespeed_framespersecond)

/* end oldMovement */
}
