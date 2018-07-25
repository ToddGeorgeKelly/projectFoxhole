time_is12HourClock = false

time_currentSecond = 0; //MEASUREMENT VARIABLES
time_currentMinute = 0;
time_currentHour = 0;
time_currentDay = 1;
time_currentWeekdayNumber = 0 ;
time_currentMonthNumber = 0;
time_currentYear = 1409;

time_maxSecond = 60;//MAX VARIABLES
time_maxMinute = 60;
time_maxHour = 24;
time_maxDay = 30;
time_maxWeekdayNumber = 7;
time_maxMonthNumber = 12;

time_currentWeekdayNameArray = [ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" ]//DAY/MONTH NAME STRING ARRAYS
time_currentMonthNameArray = [ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ]

time_currentWeekdayString = time_currentWeekdayNameArray[ time_currentWeekdayNumber ];//WEEKDAY/MONTH STRING
time_currentMonthString = time_currentMonthNameArray[ time_currentMonthNumber ];

time_secondsString	= time_currentSecond < 10 ?		"0" + string(time_currentSecond)	:	string(time_currentSecond);
time_minutesString	= time_currentMinute < 10 ?		"0" + string(time_currentMinute)	:	string(time_currentMinute);
time_hoursString	= time_currentHour	 < 10 ?		"0" + string(time_currentHour)		:	string(time_currentHour);

time_current12Hour = time_currentHour;//12 HOUR CLOCK VARIABLES
time_max12Hour = 12
time_currentAmPm = ""

time_current12TimeString =  + ":" + time_minutesString + ":" + time_secondsString + " Hours" ;//TIME READOUTS
time_currentTimeString = time_hoursString + ":" + time_minutesString + ":" + time_secondsString + " Hours" ;//TIME READOUTS
time_currentDateString = time_currentWeekdayString + " / " + time_currentMonthString + " " + string(time_currentDay) + ", " + string(time_currentYear) ;

//time_currentSeason = undefined;



time_currentAmPm = time_currentHour < 12 ? "AM" : "PM";

hour = time_is12HourClock ? time_current12Hour : time_currentHour;
suffix = time_is12HourClock ? time_currentAmPm : " Hours";

time_currentTimeString = hour + ":" + time_minutesString + ":" + time_secondsString + " Hours" ;//TIME READOUTS











time_currentSecond ++
if ( time_currentSecond == time_maxSecond) {
	time_currentSecond %= time_maxSecond 
	
	
	time_currentMinute ++
	if ( time_currentMinute == time_maxMinute) {
		time_currentMinute %= time_maxMinute
		
		current12Hour = time_currentHour mod time_max12Hour
		current12Hour ++
		
		time_currentHour ++
		if (time_currentHour == time_maxHour) {
			time_currentHour %= time_maxHour
		
		
			time_currentWeekdayNumber++
			time_currentWeekdayNumber %= time_maxWeekdayNumber
			
		
			time_currentDay ++
			if (time_currentDay == time_maxDay) {
				time_currentDay %= time_maxDay;
				time_currentDay ++
			
				time_currentMonthNumber ++
				if (time_currentMonthNumber = time_maxMonthNumber) {
					time_currentMonthNumber %= time_maxMonthNumber;
				
				
					time_currentYear ++
				}
			}
		}
	}
}

time_currentSeason = undefined;



time_secondsString = time_currentSecond < 10 ? "0" + string(time_currentSecond) : string(time_currentSecond);
time_hoursString = time_currentHour < 10 ? "0" + string(time_currentHour) : string(time_currentHour);

time_currentTimeString = 





	
	