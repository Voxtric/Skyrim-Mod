Scriptname DLC1VQ06FirstSceneTriggerScript extends ObjectReference  Conditional

Scene Property pDLC1VQ06SeranaEntryCaveScene  Auto  
ReferenceAlias Property pDLC1VQ06RNPCAlias Auto
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == pDLC1VQ06RNPCAlias.GetActorRef()
			pDLC1VQ06SeranaEntryCaveScene.Start()
			pTriggered = 1
		endif
	endif
		
endEvent