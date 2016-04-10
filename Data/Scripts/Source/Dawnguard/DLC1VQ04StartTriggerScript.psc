Scriptname DLC1VQ04StartTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ04  Auto  
GlobalVariable Property pDLC1VQ04TripFG  Auto  
ReferenceAlias Property pDLC1VQ04RNPCAlias  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDLC1VQ04TripFG.GetValue() == 0
			pDLC1VQ04TripFG.SetValue(1)
			pDLC1VQ04RNPCAlias.GetActorRef().EvaluatePackage()
		endif
	endif

endEvent