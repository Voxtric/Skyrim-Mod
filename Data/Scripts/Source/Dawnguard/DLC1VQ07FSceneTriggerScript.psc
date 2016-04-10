Scriptname DLC1VQ07FSceneTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ07  Auto  
ReferenceAlias Property pRNPCAlias Auto
int Property pTriggered Auto
int Property pStageToSet Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			pDLC1VQ07.SetStage(pStageToSet)
			pTriggered = 1
		endif
	endif

endEvent