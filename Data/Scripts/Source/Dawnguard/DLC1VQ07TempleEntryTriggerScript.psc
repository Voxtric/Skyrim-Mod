Scriptname DLC1VQ07TempleEntryTriggerScript extends ObjectReference  

Quest Property pDLC1VQ07  Auto  
int Property pTriggered Auto
ObjectReference Property pDLC1VQ07SeranaOverrideMarker  Auto  
ReferenceAlias Property pDLC1VQ07RNPCAlias  Auto  
ObjectReference Property pDLC1VQ07DoorToTempleAfterRef  Auto  
ObjectReference Property pDLC1VQ07DoorToTempleRef  Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			pDLC1VQ07RNPCAlias.GetActorRef().MoveTo(pDLC1VQ07SeranaOverrideMarker)
			pDLC1VQ07DoorToTempleRef.Disable()
			pDLC1VQ07DoorToTempleAfterRef.Enable()
				if pDLC1VQ07.GetStage() == 105
					pDLC1VQ07.SetStage(110)
				endif
				pTriggered = 1
		endif
	endif

endEvent
