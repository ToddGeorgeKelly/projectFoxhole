global.time_currentTimeString = scr_time_getTimeString()
global.time_currentDateString = scr_time_getDateString()

draw_set_color(c_black)
draw_text( 20, 20, global.time_currentTimeString );
draw_text( 20, 35, global.time_currentDateString );

draw_text( 20, 50, global.time_currentWeekdayNumber );