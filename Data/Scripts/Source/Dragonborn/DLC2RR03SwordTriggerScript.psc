Scriptname DLC2RR03SwordTriggerScript extends ObjectReference  Conditional

Quest Property pDLC2RR03 Auto
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTriggered == 0
			if pDLC2RR03.GetStageDone(60) == 0
				pDLC2RR03.SetStage(60)
				pTriggered = 1
			endif
		endif
	endif

endEvent