function system_time_tick() {
	//DO NOT EDIT-ANYTHING THAT YOU WOULD NEED TO CHANGE IS IN THE TGK_SCRIPTS_SETTINGS SCRIPT.
	//Tick the clock
	//this script is run every second to update the clock

	//Increment time system
	time.second ++;																	//SECONDS
	if ( time.second == time.secondsInMinute) {										//if 60+, mod it back down to where it should be.
		time.second %= time.secondsInMinute ;
		time.Minute ++;//MINUTES
	
		if ( time.minute == time.minutesInHour) {//if above max, mod
			time.minute %= time.minutesInHour;
			time.hour ++;
		
			if (time.hour == time.hoursInDay) {
				time.hour %= time.hoursInDay;
				time.weekdayNumber ++;//increment the weekdaynumber(mon(0), tues(1), etc.) and then mod it
				time.weekdayNumber %= time.daysInWeek;
				time.weekdayName = time.weekdayNames[time.weekdayNumber];
				time.day ++//increment the day, then if its at the max, mod it.
			
				if (time.day == time.daysInMonth) {
					time.day %= time.daysInMonth;
					time.day ++;
					time.monthNumber ++;
				
				
					if (time.monthNumber = time.monthsInYear) {
						time.monthNumber %= time.monthsInYear;
						time.monthName = time.monthNames[time.monthNumber]
				
						time.year ++;
					}
				}
			}
		}
	}


}
