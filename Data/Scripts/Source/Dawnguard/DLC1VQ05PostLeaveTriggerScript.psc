Scriptname DLC1VQ05PostLeaveTriggerScript extends ObjectReference  

Quest Property pDLC1VQ05Post Auto
Quest Property pDLC1VQDragon Auto
DLC1VQ05PostQuestScript Property pDLC1VQ05PQS Auto
GlobalVariable Property pDLC1VQ05PostMove Auto

Event OnTriggerEnter(ObjectReference akActionRef)

	if pDLC1VQ05Post.GetStage() == 20
		if pDLC1VQ05PostMove.GetValue() == 1
			if akActionRef == Game.GetPlayer()
				pDLC1VQ05PQS.ValericaGoHome()
				pDLC1VQ05PostMove.SetValue(2)
			endif
		endif
	endif

	if pDLC1VQDragon.GetStageDone(30) == 1
		if pDLC1VQDragon.GetStageDone(35) == 0
			pDLC1VQDragon.SetStage(35)
		endif
	endif

endEvent