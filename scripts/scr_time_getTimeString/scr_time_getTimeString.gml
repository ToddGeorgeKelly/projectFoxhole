global.time_currentAmPm = global.time_currentHour < 12 ? "AM" : "PM";

var hour = global.time_is12HourClock ? string(global.time_current12Hour) : string(global.time_currentHour);
var minute = global.time_currentMinute < 10 ? "0" + string(global.time_currentMinute)	: string(global.time_currentMinute);
//var second = global.time_currentSecond < 10 ?		"0" + string(global.time_currentSecond)	:	string(global.time_currentSecond);
var suffix = global.time_is12HourClock ? global.time_currentAmPm : "Hours";

return  ( hour + ":" + minute + " " + suffix );


