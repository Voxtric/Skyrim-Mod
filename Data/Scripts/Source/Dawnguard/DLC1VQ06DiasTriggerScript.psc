Scriptname DLC1VQ06DiasTriggerScript extends ObjectReference  

Quest Property pDLC1VQ6  Auto  Conditional
int Property pTriggered Auto
ReferenceAlias Property pDLC1VQ06SeranaAlias  Auto
Scene Property pDLC1VQ06ArrivalScene Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if pDLC1VQ6.IsRunning() == 1
			if akActionRef == pDLC1VQ06SeranaAlias.GetActorRef()
				pDLC1VQ06ArrivalScene.Start()
				pTriggered = 1
			endif
		endif
	endif

endEvent
