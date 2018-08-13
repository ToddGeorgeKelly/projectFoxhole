scr_mvmt_keyboardRequest()


if (keyboard_check(vk_space)) {
	instance_deactivate_object(time)
} else if (keyboard_check_released(vk_space)) {
	instance_activate_object(time)
}

