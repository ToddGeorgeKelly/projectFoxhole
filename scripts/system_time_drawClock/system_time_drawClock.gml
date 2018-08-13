#region GATHER ALL DATA NEEDED TO DRAW THE CLOCK AND STORE IT AS A STRING
var minuteString = string(time.minute);
var dayOfWeekString = string(time.weekdayName);
var dayString = string(time.day);
var monthString = string(time.monthName);
var yearString = string(time.year);


//Set the hourString and the suffix for the visible clock 
if (is12HourTime) {
	var twelveHour = time.hour < (time.amPmThreshold + 1) ? time.hour : ((hour mod (time.amPmThreshold + 1)) + 1);
	if (twelveHour == 0) twelveHour = 12;
	var hourString = string(twelveHour);
	var suffix = time.hour < 12 ? "AM" : "PM";
} else {
	var hourString = string(time.hour);
	var suffix = "Hours";
}
#endregion

#region DRAW THE CLOCK ON THE SCREEN
draw_set_color(c_black)
draw_text( 20, 20, hourString + ":" + minuteString + " " + suffix )
draw_text( 20, 35, dayOfWeekString + " - " + monthString + " " + dayString + ", " + yearString)
#endregion