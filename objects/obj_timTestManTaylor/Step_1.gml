/// @description Insert description here
if ( loopingRequest != undefined ) {
	var queueLength = array_height_2d(movementQueue)
	for ( i = 0; i < array_length_2d(loopingRequest, 0); i ++ ) {
		movementQueue[ queueLength, i] = loopingRequest[ 0, i ]
	}
}




_scr_mvmt_keyboardRequest()