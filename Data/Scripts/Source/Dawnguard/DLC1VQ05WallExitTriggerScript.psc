Scriptname DLC1VQ05WallExitTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ05 Auto
ReferenceAlias Property pDLC1VQ05RNPCAlias Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDLC1VQ05.GetStageDone(18) == 0
			pDLC1VQ05.SetStage(18)
		endif
	endif

endEvent