Scriptname DLC2RRJailGateSwapScript extends ObjectReference  Conditional

ObjectReference Property pDLC2RRJailGrateSwap Auto
Int Property pSwapDone Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pSwapDone == 0
			pDLC2RRJailGrateSwap.Disable()
			pSwapDone = 1
		endif
	endif

EndEvent