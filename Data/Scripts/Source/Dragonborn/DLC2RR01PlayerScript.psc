Scriptname DLC2RR01PlayerScript extends ReferenceAlias  Conditional

Quest Property pDLC2RR01 Auto
Book Property pDLC2RR01SurrenderMessage Auto
Book Property pDLC2RR01AlternateMessage Auto

Event OnInit()

	AddInventoryEventFilter(pDLC2RR01SurrenderMessage)
	AddInventoryEventFilter(pDLC2RR01AlternateMessage)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if akBaseItem == pDLC2RR01SurrenderMessage
		if pDLC2RR01.GetStageDone(60) == 0
			if pDLC2RR01.GetStage() == 50
				pDLC2RR01.SetStage(60)
			endif
		endif
	endif

	if akBaseItem == pDLC2RR01AlternateMessage
		if pDLC2RR01.GetStageDone(110) == 0
			pDLC2RR01.SetStage(110)
		endif
	endif

endEvent