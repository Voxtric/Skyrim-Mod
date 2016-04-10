Scriptname DLC1VQSaintPageAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC1VQSaint  Auto  
GlobalVariable Property pDLC1VQSaintCount Auto
GlobalVariable Property pDLC1VQSaintTotal Auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)

	if akNewContainer == Game.GetPlayer()
		if pDLC1VQSaint.GetStage() == 20
			if pDLC1VQSaint.ModObjectiveGlobal(1, pDLC1VQSaintCount, 10, pDLC1VQSaintTotal.Value)
  				pDLC1VQSaint.SetStage(30)
			endif
		elseif pDLC1VQSaint.GetStage() < 20
			pDLC1VQSaintCount.SetValue(pDLC1VQSaintCount.GetValue() +1)
		endif
	endif

endEvent