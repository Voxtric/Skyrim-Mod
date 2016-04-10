Scriptname DLC2TGPlayerScript extends ReferenceAlias  Conditional

Quest Property pDLC2TGQuest Auto
Quest Property pTG02B Auto
Book Property pDLC2TGFormula Auto 
GlobalVariable Property pDLC2TGGlobal01 Auto

Event OnInit()

	AddInventoryEventFilter(pDLC2TGFormula)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if akBaseItem == pDLC2TGFormula
		if pDLC2TGQuest.GetStage() == 10
			pDLC2TGQuest.SetStage(20)
		elseif pDLC2TGQuest.GetStage() < 10
			pDLC2TGGlobal01.SetValue(1)
				if pTG02B.GetStageDone(200) == 1
					pDLC2TGQuest.SetObjectiveDisplayed(20,1)
				endif
		endif	
	endif	

endEvent