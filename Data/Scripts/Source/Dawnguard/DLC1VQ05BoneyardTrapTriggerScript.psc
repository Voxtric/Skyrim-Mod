Scriptname DLC1VQ05BoneyardTrapTriggerScript extends ObjectReference  

Quest Property pDLC1VQ05  Auto
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			pDLC1VQ05.SetStage(70)
			pTriggered = 1
		endif
	endif

endEvent
