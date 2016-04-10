Scriptname DLC1VQ04BookAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC1VQ04 Auto  
int Property pBeenRead Auto
GlobalVariable Property pDLC1VQ04BookPre Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if pBeenRead == 0
			if pDLC1VQ04.GetStage() >= 50
				pDLC1VQ04.SetStage(55)
				pBeenRead = 1
			elseif pDLC1VQ04.GetStage() < 50
				pDLC1VQ04BookPre.SetValue(1)
				pBeenRead = 1
			endif
		endif
	endif

endEvent