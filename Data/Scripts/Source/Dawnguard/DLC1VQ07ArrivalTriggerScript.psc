Scriptname DLC1VQ07ArrivalTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ07  Auto  
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if pDLC1VQ07.GetStage() == 10
			if akActionRef == Game.GetPlayer()
				pDLC1VQ07.SetStage(20)
				pTriggered = 1
			endif
		endif
	endif

endEvent