var xx = 0;
var yy = 0;

moveSpeed = keyboard_check(vk_lshift) ? 4 : 8;

//Movement
currentLeftRight = keyboard_key == KEY_LEFT || keyboard_key == KEY_RIGHT ? keyboard_key : undefined;//check which key(RIGHT or LEFT) was most recently pressed. 
//currentUpDown = keyboard_key == KEY_UP || keyboard_key == KEY_DOWN ? keyboard_key : undefined;//check which key(UP or DOWN) was most recently pressed. 

//RIGHT/LEFT MOVEMENT
if ( keyboard_check(KEY_LEFT) && keyboard_check(KEY_RIGHT) && currentLeftRight == KEY_RIGHT ) {
	//GO RIGHT
	xx = moveSpeed
} else if ( keyboard_check(KEY_LEFT) && keyboard_check(KEY_RIGHT) && currentLeftRight == KEY_LEFT ) {
	//GO LEFT
	xx = -moveSpeed
} else if ( keyboard_check(KEY_RIGHT) ) {
	//GO RIGHT
	xx = moveSpeed
} else if ( keyboard_check(KEY_LEFT) ) {
	//GO LEFT
	xx = -moveSpeed
}



//UP/DOWN MOVEMENT
if ( keyboard_check(KEY_DOWN) ) {
	//GO DOWN
	yy = moveSpeed
}
if ( keyboard_check(KEY_UP) ) {
	//GO UP
	yy = -moveSpeed 
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
if (xx != 0 || yy != 0) {
	scr_mvmt_moveByXYRate(obj_timTestManTaylor, xx, yy, 3)
}