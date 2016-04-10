Scriptname DLC2RR01EnableTriggerScript extends ObjectReference  

Quest Property pDLC2RR01 Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDLC2RR01.GetStageDone(20) == 0
			pDLC2RR01.SetStage(20)
		endif
	endif	

endEvent