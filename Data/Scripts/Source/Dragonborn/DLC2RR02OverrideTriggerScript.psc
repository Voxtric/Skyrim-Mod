Scriptname DLC2RR02OverrideTriggerScript extends ObjectReference  Conditional

Quest Property pDLC2RR02 Auto

Event OnTriggerEnter(ObjectReference akActionRef)
  
	if akActionRef == Game.GetPlayer()
		if pDLC2RR02.IsObjectiveDisplayed(65) == 1
			pDLC2RR02.SetStage(85)
		endif
	endif

EndEvent