Scriptname DLC1VQ06ArrivalTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ06  Auto  
Int Property pTriggered  Auto  
GlobalVariable Property pDLC1VQ06LocationToggle  Auto  

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			pDLC1VQ06LocationToggle.SetValue(1)			
			pTriggered = 1
		endif
	endif

endEvent