moveSpeed = keyboard_check(vk_lshift) ? 6: 4;

//Movement
currentLeftRight = keyboard_key == KEY_LEFT || keyboard_key == KEY_RIGHT ? keyboard_key : undefined;//check which key(RIGHT or LEFT) was most recently pressed. 
x = keyboard_check(KEY_LEFT) && keyboard_check(KEY_RIGHT) && currentLeftRight == KEY_RIGHT? x + moveSpeed: x;//if holding both, but the most recent was right, go right.
x = keyboard_check(KEY_LEFT) && keyboard_check(KEY_RIGHT) && currentLeftRight == KEY_LEFT ? x - moveSpeed: x;//if holding both, but the most recent was left, go left.
x = keyboard_check(KEY_RIGHT)?	x + moveSpeed : x; //if JUST pressing right, go right.
x = keyboard_check(KEY_LEFT) ?	x - moveSpeed : x; //if JUST pressing left, go left. 

currentUpDown = keyboard_key == KEY_UP || keyboard_key == KEY_DOWN ? keyboard_key : undefined;//check which key(UP or DOWN) was most recently pressed. 
y = keyboard_check(KEY_UP) && keyboard_check(KEY_DOWN) && currentUpDown == KEY_DOWN ?	y + moveSpeed: y;//if holding both, but the most recent was down, go down. 
y = keyboard_check(KEY_UP) && keyboard_check(KEY_DOWN) && currentUpDown == KEY_UP	?	y - moveSpeed: y;//if holding both, but the most recent was up, go up.
y = keyboard_check(KEY_DOWN)?	y + moveSpeed : y; //if JUST holding down, go down.
y = keyboard_check(KEY_UP)	?	y - moveSpeed : y; //if JUST holding up, go up. 

//Direction Detection
direction = keyboard_check(KEY_RIGHT)?	0 : direction ; 
direction = keyboard_check(KEY_LEFT)?	180 : direction ;
direction = keyboard_check(KEY_LEFT) && keyboard_check(KEY_RIGHT) && currentLeftRight == KEY_LEFT? 180: direction;
direction = keyboard_check(KEY_LEFT) && keyboard_check(KEY_RIGHT) && currentLeftRight == KEY_RIGHT? 0 : direction;

direction = keyboard_check(KEY_UP)?	90 : direction;
direction = keyboard_check(KEY_DOWN)? 270 : direction;
direction = keyboard_check(KEY_UP) && keyboard_check(KEY_DOWN) && currentUpDown == KEY_DOWN? 270 : direction;
direction = keyboard_check(KEY_UP) && keyboard_check(KEY_DOWN) && currentUpDown == KEY_UP? 90: direction;

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

sprite_set_speed(sprite_index, moveSpeed * 1.4, spritespeed_framespersecond)