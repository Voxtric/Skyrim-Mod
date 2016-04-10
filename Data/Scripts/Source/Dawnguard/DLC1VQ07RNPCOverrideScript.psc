Scriptname DLC1VQ07RNPCOverrideScript extends ObjectReference  Conditional

int Property pTriggered Auto
ObjectReference Property pDLC1VQ07LastTriggerRef  Auto  
ReferenceAlias Property pDLC1VQ07RNPCAlias  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			pDLC1VQ07RNPCAlias.GetActorRef().MoveTo(pDLC1VQ07LastTriggerRef)
			pTriggered = 1
		endif		
	endif

endEvent

