Scriptname DLC1FVBBookScript extends ReferenceAlias  

Quest Property pDLC1VQFVBooks Auto
GlobalVariable Property pDLC1FVBGotABook Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		pDLC1FVBGotABook.SetValue(pDLC1FVBGotABook.GetValue() + 1)
		if pDLC1VQFVBooks.GetStageDone(20) == 0
			pDLC1VQFVBooks.SetStage(20)
		endif
	endif
	
endEvent