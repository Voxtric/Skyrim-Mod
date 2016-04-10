Scriptname DLCWeatherSwapZoneSCRIPT extends ObjectReference  
{Changes the weather when you are in this trigger.}

Import Weather

Weather property WeatherForm auto
{The name of the Weather we will see while in the triggr box, if we have one.}


int Property timeLimit = 10000 Auto
{Time to wait before auto releasing the weather.}

;===============================================

	EVENT ONTRIGGERENTER(ObjectReference akActionRef)
		if (akActionRef == game.getPlayer() as ObjectReference)	;Should be expanded to include all actors
			WeatherForm.SetActive(True,True)
		endif
	endEvent

	EVENT OnTriggerLeave(ObjectReference akActionRef)
		ReleaseOverride()
	ENDEVENT
	
	EVENT OnUnLoad()
		ReleaseOverride()
	ENDEVENT
	
