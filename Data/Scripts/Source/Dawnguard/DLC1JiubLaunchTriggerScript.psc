Scriptname DLC1JiubLaunchTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQSaint Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDLC1VQSaint.GetStageDone(10) == 0
			pDLC1VQSaint.SetStage(10)
		endif
	endif

endEvent