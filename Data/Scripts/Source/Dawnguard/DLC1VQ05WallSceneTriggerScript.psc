Scriptname DLC1VQ05WallSceneTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ05 Auto
ReferenceAlias Property pDLC1VQ05RNPCAlias Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == pDLC1VQ05RNPCAlias.GetActorRef()
		if pDLC1VQ05.GetStageDone(12) == 0
			pDLC1VQ05.SetStage(12)
		endif
	endif

endEvent