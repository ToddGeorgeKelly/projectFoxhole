//TICK, RUN EVERY second

//Increment time system
global.time_currentSecond ++; //SECONDS
if ( global.time_currentSecond == global.time_maxSecond) {//if 60+, mod it back down to where it should be.
	global.time_currentSecond %= global.time_maxSecond ;
	
	
	global.time_currentMinute ++;//MINUTES
	if ( global.time_currentMinute == global.time_maxMinute) {//if above max, mod
		global.time_currentMinute %= global.time_maxMinute;
		
		global.time_current12Hour = global.time_currentHour mod (global.time_max12Hour + 1)//12HOUR CLOCK: HOURS
		global.time_current12Hour ++;
		
		global.time_currentHour ++;//24HOUR CLOCK: HOURS  -  NOTE:the game will use the 24 hour clock to track events, the 12 hour clock is for player comfort only
		if (global.time_currentHour == global.time_maxHour) {
			global.time_currentHour %= global.time_maxHour;
		
		
			global.time_currentWeekdayNumber++;//increment the weekdaynumber(mon(0), tues(1), etc.) and then mod it
			global.time_currentWeekdayNumber %= global.time_maxWeekdayNumber;
			
		
			global.time_currentDay ++//increment the day, then if its at the max, mod it. 
			if (global.time_currentDay == global.time_maxDay) {
				global.time_currentDay %= global.time_maxDay;
				global.time_currentDay ++;
			
			
				global.time_currentMonthNumber ++;
				if (global.time_currentMonthNumber = global.time_maxMonthNumber) {
					global.time_currentMonthNumber %= global.time_maxMonthNumber;
				
				
					global.time_currentYear ++;
				}
			}
		}
	}
}