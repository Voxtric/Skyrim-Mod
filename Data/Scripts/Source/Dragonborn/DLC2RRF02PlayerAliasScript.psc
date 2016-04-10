Scriptname DLC2RRF02PlayerAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC2RRFavor02 Auto
DLC2RRFavor02QuestScript Property pDLC2RRF02QS Auto
Ingredient Property DLC2NetchJelly Auto

Event OnInit()

	AddInventoryEventFilter(DLC2NetchJelly)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if akBaseItem == DLC2NetchJelly
		if pDLC2RRFavor02.GetStageDone(20) == 1
			pDLC2RRF02QS.JellyCount()
		endif
	endif

endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)

	if akBaseItem == DLC2NetchJelly
		if pDLC2RRFavor02.GetStageDone(20) == 1
			pDLC2RRF02QS.JellyCount()
		endif
	endif	

endEvent  
