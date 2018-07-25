global.time_currentAmPm = global.time_currentHour < 12 ? "AM" : "PM";

var hour = global.time_is12HourClock ? string(global.time_current12Hour) : string(global.time_currentHour);
var minute = global.time_currentMinute < 10 ? "0" + string(global.time_currentMinute)	: string(global.time_currentMinute);
var second = global.time_currentSecond < 10 ?		"0" + string(global.time_currentSecond)	:	string(global.time_currentSecond);
var suffix = global.time_is12HourClock ? global.time_currentAmPm : "Hours";

var weekday = global.time_currentWeekdayString;
var month = global.time_currentMonthString;
var day = string(global.time_currentDay);
var year = string(global.time_currentYear);

global.time_currentTimeString = hour + ":" + minute + ":" + second + " " + suffix;//TIME READOUTS
global.time_currentDateString = weekday + " - " + month + " " + day + ", " + year;

draw_text( 60, 75, global.time_currentTimeString );
draw_text( 60, 90, global.time_currentDateString );