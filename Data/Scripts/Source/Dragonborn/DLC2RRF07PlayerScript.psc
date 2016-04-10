Scriptname DLC2RRF07PlayerScript extends ReferenceAlias  

Quest Property pDLC2RRFavor07 Auto
Book Property pDLC2RRF07Book Auto
GlobalVariable Property pDLC2RRF07BookFound Auto

Event OnInit()

	AddInventoryEventFilter(pDLC2RRF07Book)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if akBaseItem == pDLC2RRF07Book
		if pDLC2RRFavor07.GetStageDone(20) == 1
			pDLC2RRFavor07.SetStage(30)
		elseif pDLC2RRFavor07.GetStageDone(20) == 0
			pDLC2RRFavor07.SetObjectiveDisplayed(20,1)
			pDLC2RRF07BookFound.SetValue(1)
		endif
	endif

endEvent