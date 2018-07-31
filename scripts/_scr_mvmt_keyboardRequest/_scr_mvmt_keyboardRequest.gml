xx = 0;
yy = 0;

moveSpeed = keyboard_check(vk_lshift) ? defaultSprintSpeed : defaultMoveSpeed;

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

if ( keyboard_check(KEY_UP) ) {
	//GO UP
	yy = -moveSpeed 
}
if ( keyboard_check(KEY_DOWN) ) {
	//GO DOWN
	yy = moveSpeed
}



//show_debug_message( string(direction) )
scr_mvmt_spriteDetermination()

if (xx != 0 || yy != 0) {
	scr_mvmt_moveByXYRate(id, xx, yy, 3, true)
}
