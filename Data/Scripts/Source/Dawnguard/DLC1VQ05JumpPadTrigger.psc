Scriptname DLC1VQ05JumpPadTrigger extends ObjectReference  Conditional

GlobalVariable Property pDLC1VQ05JumpPad  Auto  Conditional

Event OnTriggerEnter(ObjectReference akActionRef)
	
	if akActionRef == Game.GetPlayer()
		if pDLC1VQ05JumpPad.GetValue() == 0
			pDLC1VQ05JumpPad.SetValue(1)
		endif
	endif

endEvent