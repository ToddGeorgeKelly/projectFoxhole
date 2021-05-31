function system_game_settings() {

#region GENERAL SETTINGS



#endregion

#region	TIME SETTINGS
	
		//General
		time.is12HourTime =		false
		time.secondsInMinute =	10
		time.minutesInHour =	60
		time.hoursInDay =		24
		time.daysInWeek =		7
		time.daysInMonth =		[ 30, 28, 30, 29, 30, 31, 30, 29, 30, 31, 30, 31 ]
		time.monthsInYear =		12
		time.weekdayNames =		[ "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday" ];
		time.monthNames =		[ "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "Decemeber" ];
		time.amPmThreshold =	12

		//SET THE VALUES THAT THE GAME WILL START WITH
		time.second =			0;
		time.minute =			0;
		time.hour24 =			0;
		time.weekdayNumber =	0;
		time.weekdayName =		"Monday";
		time.day =				1;
		time.monthNumber =		1;
		time.monthName =		"January";
		time.year =				1444;
	
		//SET UP INTERNALS OF TIME SYSTEM
		//system_time_internals()						//---this script sets up the rest of the time system and should not be edited.
#endregion

#region	MOVEMENT SETTINGS
		//General
	#macro defaultMoveSpeed			8			//---Default Movement Speed
	#macro defaultSneakSpeed		4			//---Default sneak or crouch movement speed
	#macro defaultSprintSpeed		12			//---Default spring or running speed
	
		//COLLISION SETTINGS
	#macro shiftSpeed				2
	#macro shiftSearchAngle			45
	#macro shiftMovementAngle		90
	#macro shiftSearchDistance		2
	
	
		//Keyboard Controls & Keyboard Movement Request Priority
	#macro KEY_UP					ord("W")	//---Up
	#macro KEY_DOWN					ord("S")	//---Down
	#macro KEY_LEFT					ord("A")	//---Left
	#macro KEY_RIGHT				ord("D")	//---Right
	#macro KEY_SNEAK				vk_lcontrol	//---Sneak/Crouch
	#macro KEY_SPRINT				vk_lshift	//---Sprint/Run
	#macro keyboardPriority			3			//---The Priority of keyboard movement requests
	
		//SET UP INTERNALS OF MOVEMENT SYSTEM
		//system_movement_internals()
#endregion


}
