Scriptname DLC2RR01ToggleTriggerScript extends ObjectReference  

Quest Property pDLC2RR01 Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDLC2RR01.GetStageDone(30) == 0
			if pDLC2RR01.GetStageDone(100) == 0
				pDLC2RR01.SetStage(30)
				Disable()
			endif
		endif
	endif	

endEvent