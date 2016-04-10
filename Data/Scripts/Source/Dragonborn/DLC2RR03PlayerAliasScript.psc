Scriptname DLC2RR03PlayerAliasScript extends ReferenceAlias  Conditional

Quest Property pDLC2RR03 Auto
Book Property pDLC2RR03GratiansJournal Auto

Event OnInit()

	AddInventoryEventFilter(pDLC2RR03GratiansJournal)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if akBaseItem == pDLC2RR03GratiansJournal
		if pDLC2RR03.GetStageDone(30) == 0
			pDLC2RR03.SetStage(30)
		endif
	endif

endEvent