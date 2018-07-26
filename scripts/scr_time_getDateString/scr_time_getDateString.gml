var weekday = scr_time_getWeekdayName()
var month = scr_time_getMonthName();
var day = string(global.time_currentDay);
var year = string(global.time_currentYear);


return ( weekday + " - " + month + " " + day + ", " + year);