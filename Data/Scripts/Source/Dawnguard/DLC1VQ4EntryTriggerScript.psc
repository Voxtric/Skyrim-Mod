Scriptname DLC1VQ4EntryTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ4Hunter  Auto  Conditional
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			if pDLC1VQ4Hunter.GetStage() == 20
				pDLC1VQ4Hunter.SetStage(30)
				pTriggered = 1
			endif
		endif
	endif

endEvent