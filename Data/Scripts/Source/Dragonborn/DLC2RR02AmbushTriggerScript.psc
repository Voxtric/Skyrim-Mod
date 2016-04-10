Scriptname DLC2RR02AmbushTriggerScript extends ObjectReference  

Quest Property pDLC2RR02  Auto  
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pTriggered == 0
		if akActionRef == Game.GetPlayer()
			if pDLC2RR02.GetStage() == 60
				pDLC2RR02.SetStage(70)
				pTriggered = 1
			endif
		endif
	endif

endEvent