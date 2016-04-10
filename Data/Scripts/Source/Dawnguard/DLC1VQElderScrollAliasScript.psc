Scriptname DLC1VQElderScrollAliasScript extends ReferenceAlias  Conditional

int Property pGotScroll Auto
int Property pStageToSet Auto
Quest Property pDLC1VQElder Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if pGotScroll == 0
		if akNewContainer == Game.GetPlayer()
			pDLC1VQElder.SetStage(pStageToSet)
			pGotScroll = 1
		endif
	endif

endEvent