Scriptname DLC1VQ07DarkfallSetupTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ07  Auto  
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if pDLC1VQ07.GetStage() == 50
			if akActionRef == Game.GetPlayer()
				pDLC1VQ07.SetStage(55)
				pTriggered = 1
			endif
		endif
	endif

endEvent