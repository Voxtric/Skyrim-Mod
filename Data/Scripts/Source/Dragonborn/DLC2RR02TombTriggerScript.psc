Scriptname DLC2RR02TombTriggerScript extends ObjectReference  Conditional

Quest Property pDLC2RR02  Auto  
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			if pDLC2RR02.GetStage() == 30
				pDLC2RR02.SetStage(40)
				pTriggered = 1
			endif
		endif
	endif

endEvent