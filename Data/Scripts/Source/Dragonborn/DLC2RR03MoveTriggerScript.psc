Scriptname DLC2RR03MoveTriggerScript extends ObjectReference  Conditional

Quest Property pDLC2RR03 Auto
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTriggered == 0
			if pDLC2RR03.GetStageDone(20) == 1
				pDLC2RR03.SetStage(25)
				pTriggered = 1
			endif
		endif
	endif

endEvent