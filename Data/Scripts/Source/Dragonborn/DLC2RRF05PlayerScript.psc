Scriptname DLC2RRF05PlayerScript extends ReferenceAlias  Conditional

Quest Property pDLC2RRFavor05 Auto
Armor Property pDLC2RRF05EECNecklace Auto 

Event OnInit()

	AddInventoryEventFilter(pDLC2RRF05EECNecklace)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if akBaseItem == pDLC2RRF05EECNecklace
		if pDLC2RRFavor05.GetStage() == 20
			pDLC2RRFavor05.SetStage(30)
		endif
	endif

endEvent