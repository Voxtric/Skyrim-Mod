Scriptname DLC2RR02DeadGuardsTriggerScript extends ObjectReference  

Quest Property pDLC2RR02 Auto
int Property pTriggered Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pTriggered == 0
			if pDLC2RR02.GetStage() == 80
				pDLC2RR02.SetStage(85)
				pTriggered = 1
			endif
		endif
	endif

endEvent