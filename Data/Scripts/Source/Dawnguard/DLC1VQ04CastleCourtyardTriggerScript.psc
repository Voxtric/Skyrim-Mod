Scriptname DLC1VQ04CastleCourtyardTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ04  Auto  
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			if pDLC1VQ04.GetStage() == 20
				pDLC1VQ04.SetStage(25)
				pTriggered = 1
			endif
		endif
	endif

endEvent