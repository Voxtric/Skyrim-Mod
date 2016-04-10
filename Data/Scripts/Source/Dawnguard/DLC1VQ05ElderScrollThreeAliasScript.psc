Scriptname DLC1VQ05ElderScrollThreeAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC1VQ05  Auto  

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if pDLC1VQ05.GetStageDone(130) == 0
		if akNewContainer == Game.GetPlayer()
			pDLC1VQ05.SetStage(130)
		endif
	endif

endEvent