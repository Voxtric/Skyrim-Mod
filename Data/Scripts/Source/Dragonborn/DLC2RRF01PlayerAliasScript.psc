Scriptname DLC2RRF01PlayerAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC2RRFavor01 Auto
Book Property pDLC2RRF01Recipe Auto 

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if akBaseItem == pDLC2RRF01Recipe
		if pDLC2RRFavor01.GetStageDone(30) == 0
			pDLC2RRFavor01.SetStage(30)
		endif
	endif

endEvent
