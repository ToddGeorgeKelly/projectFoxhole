//SPRITE DETERMINATION
if (keyboard_check(vk_control)) {
	sprite_index = sneakWalk
} else {	
	switch (facingDirection)	{

		case 0://Right
			sprite_index = keyboard_check(KEY_RIGHT)? walkRight : standRight;
			break;
	
		case 90://Up
			sprite_index = keyboard_check(KEY_UP) ? walkUp : standUp;
			break;
	
		case 180://Left
			sprite_index = keyboard_check(KEY_LEFT) ? walkLeft : standLeft;
			break;
		
		case 270://Down
			sprite_index = keyboard_check(KEY_DOWN) ? walkDown : standDown;
			break;
		
		case 45://Up Right
			sprite_index = keyboard_check(KEY_UP)? walkUp : standUp;
			break;
	
		case 135://Up Left
			sprite_index = keyboard_check(KEY_UP)? walkUp : standUp;
			break;
	
		case 225://Down Left
			sprite_index = keyboard_check(KEY_DOWN) ? walkDown : standDown;
			break;
	
		case 315://Down Right
			sprite_index = keyboard_check(KEY_DOWN) ? walkDown : standDown;
			break;
	}
}

sprite_set_speed(sprite_index, moveSpeed+2, spritespeed_framespersecond)