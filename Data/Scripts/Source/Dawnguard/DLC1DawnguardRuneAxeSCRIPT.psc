Scriptname DLC1DawnguardRuneAxeSCRIPT extends ObjectReference  

GLOBALVARIABLE PROPERTY gameDay AUTO
GLOBALVARIABLE PROPERTY gameHour AUTO
GLOBALVARIABLE PROPERTY undeadKilled AUTO

INT currentDay=0
BOOL registerOnce=false

EVENT onLoad()
	;when we equip, set the current day
	currentDay = gameDay.GetValueInt();
	RegisterForUpdateGameTime(1)

ENDEVENT

EVENT onEquip()
	
	;if gameday is the next day, reset the value
	if(gameDay.GetValue() > currentDay)
		undeadKilled.SetValue(0)		

	endif

	;when we equip, set the current day
	currentDay = gameDay.GetValueInt();


ENDEVENT

EVENT onUnEquip()
		;unRegisterForUpdateGameTime()

ENDEVENT

EVENT onUpdateGameTime()
	
	;if its after 5 and the next day, reset and set today as the current day
	if(gameHour.GetValueInt() >= 5 && gameDay.GetValue() > currentDay)
		undeadKilled.SetValue(0)
		currentDay = gameDay.GetValueInt()
	endif

ENDEVENT
