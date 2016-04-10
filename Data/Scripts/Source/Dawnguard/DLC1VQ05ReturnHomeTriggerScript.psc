Scriptname DLC1VQ05ReturnHomeTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ05  Auto
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			if pDLC1VQ05.GetStage() >= 130
				if pDLC1VQ05.GetStageDone(200) == 0
					pDLC1VQ05.SetStage(200)
					pTriggered = 1
				endif
			endif
		endif
	endif

endEvent