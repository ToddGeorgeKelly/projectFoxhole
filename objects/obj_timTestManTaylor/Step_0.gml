/// @description Insert description here
depth = -y

if (wantsToMove) {
	scr_mvmt_runEngine()
}
 if ( keyboard_check_pressed(vk_space) ) {
 
	scr_mvmt_moveByXYRate(id, 20, 20, 0, false, false, 4)
 }
