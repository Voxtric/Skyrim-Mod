Scriptname DLC1VQ07BalconyTriggerScript extends ObjectReference  

GlobalVariable Property pDLC1VQ07BalconyTrigger  Auto  
Quest Property pDLC1VQ07 Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDLC1VQ07.GetStageDone(132) == 0
			pDLC1VQ07.SetStage(132)
		endif
	endif

endEvent