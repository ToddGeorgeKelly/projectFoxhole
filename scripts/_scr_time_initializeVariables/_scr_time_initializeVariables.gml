show_debug_message( "Clock Variables Setting...")
global.time_currentFps = game_get_speed(gamespeed_fps)

global.time_is12HourClock = true
global.time_current12Hour = 12;
global.time_currentAmPm = "";
#macro time_ampmThreshold 12

#macro time_maxSecond 10//this is the number of IRL seconds you want to equal one IN GAME minute
#macro time_maxMinute 60
#macro time_maxHour 24
#macro time_maxWeekdayNumber 7
#macro time_maxMonthNumber 12

global.time_weekdayNameArray = [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" ]
global.time_monthNameArray = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "Decemeber" ]
global.time_maxDayArray = [ 30, 28, 30, 29, 30, 31, 30, 29, 30, 31, 30, 31 ]


global.time_currentSecond = 0;
global.time_currentMinute = 0;
global.time_currentHour = 0;
global.time_currentDay = 1;
global.time_currentWeekdayNumber = 0;
global.time_currentWeekdayString = scr_time_getWeekdayName();
global.time_currentMonthNumber = 0;
global.time_currentMonthString = scr_time_getMonthName();
global.time_currentYear = 1409;
global.time_currentMaxDay = 30



