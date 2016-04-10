Scriptname DLC1WeatherChangeTrigger extends ObjectReference Hidden
{Changes the weather when you are in this trigger.}

Import Weather

Weather property WeatherForm auto
{The name of the Weather we will see while in the triggr box, if we have one.}


;===============================================

	EVENT ONTRIGGERENTER(ObjectReference akActionRef)

		WeatherForm.ForceActive(True)

	endEvent
	
		EVENT OnCellDetach()
			ReleaseOverride()
	ENDEVENT
	