/// @description Insert description here
/*/var collisionLayerId = layer_get_id(layer_collision)


//Sprite declarations
facingDirection = direction
standRight = spr_timStandRIght
standUp = spr_timStandUp
standLeft = spr_timStandLeft
standDown = spr_timStandDown
walkRight = spr_timWalkRight
walkUp = spr_timWalkUp
walkLeft = spr_timWalkLeft
walkDown = spr_timWalkDown

//CLOCK
global.tml_tick = timeline_add()
timeline_moment_add_script( global.tml_tick, global.time_currentFps, scr_time_tickAndUpdate )
timeline_index = global.tml_tick
timeline_position = 0
timeline_running = true
timeline_loop = true