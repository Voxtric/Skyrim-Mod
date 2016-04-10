Scriptname DLC2TTF2PlayerScript extends ReferenceAlias  

Ingredient Property Taproot  Auto  
GlobalVariable Property TaprootsAcquired  Auto  
Quest Property DLC2TTF2 Auto

Event OnInit()
	AddInventoryEventFilter(Taproot)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if DLC2TTF2.GetStage() == 100
		TaprootsAcquired.SetValue(GetActorRef().GetItemCount(Taproot))
		if TaprootsAcquired.GetValue() >= 3
			TaprootsAcquired.SetValue(3)
		endif
		DLC2TTF2.UpdateCurrentInstanceGlobal(TaprootsAcquired)
		if TaprootsAcquired.GetValue() == 3
			DLC2TTF2.SetObjectiveCompleted(100, true)
			DLC2TTF2.SetObjectiveDisplayed(110, true)
		else
			DLC2TTF2.SetObjectiveDisplayed(100, false)
			DLC2TTF2.SetObjectiveDisplayed(100, true)
		endIf		
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if DLC2TTF2.GetStage() == 100
		TaprootsAcquired.SetValue(GetActorRef().GetItemCount(Taproot))
		if TaprootsAcquired.GetValue() >= 3
			TaprootsAcquired.SetValue(3)
		endif
		DLC2TTF2.UpdateCurrentInstanceGlobal(TaprootsAcquired)
		if TaprootsAcquired.GetValue() < 3
			DLC2TTF2.SetObjectiveCompleted(100, false)
			DLC2TTF2.SetObjectiveDisplayed(110, false)
			DLC2TTF2.SetObjectiveDisplayed(100, true)
		endIf		
	endif
EndEvent

