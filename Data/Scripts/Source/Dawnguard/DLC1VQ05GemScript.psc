Scriptname DLC1VQ05GemScript extends ReferenceAlias  Conditional

Quest Property pDLC1VQ05GemHandler Auto
int Property pGemDone Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if pGemDone == 0
			if pDLC1VQ05GemHandler.GetStage() < 30
				pDLC1VQ05GemHandler.SetStage(30)
				pGemDone = 1
			endif
		endif
	endif

endEvent