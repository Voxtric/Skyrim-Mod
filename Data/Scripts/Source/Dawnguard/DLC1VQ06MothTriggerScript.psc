Scriptname DLC1VQ06MothTriggerScript extends ObjectReference  Conditional

Quest Property pDLC1VQ06 Auto
DLC1VQ06QuestScript Property pDLC1VQ06QS Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if akActionRef == Game.GetPlayer()
		if pDLC1VQ06.GetStage() >= 30 && pDLC1VQ06.GetStage() < 50
			pDLC1VQ06QS.AddMoths()
			Self.Disable()
		endif
	endif

endEvent