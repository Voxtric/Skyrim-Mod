Scriptname DLC1VQ07WayshrineActScript extends ObjectReference  

Quest Property pDLC1VQ07 Auto

Event OnActivate(ObjectReference akActionRef)

	if pDLC1VQ07.GetStage() == 100
		if akActionRef == Game.GetPlayer()
			GetLinkedRef().Activate(akActionRef)
			pDLC1VQ07.SetStage(105)
		endif
	endif

endEvent