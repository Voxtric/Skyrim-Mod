Scriptname DLC2TTR2PlayerScript extends ReferenceAlias  

Quest Property DLC2TTR2  Auto  
GlobalVariable Property HeartStoneAcquired  Auto  
MiscObject Property DLC2HeartStone  Auto  

Event OnInit()
	AddInventoryEventFilter(DLC2HeartStone)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if DLC2TTR2.GetStage() == 100 || DLC2TTR2.GetStage() == 200
		HeartStoneAcquired.SetValue(GetActorRef().GetItemCount(DLC2HeartStone))
		if HeartStoneAcquired.GetValue() >= 1
			HeartStoneAcquired.SetValue(1)
		endif
		DLC2TTR2.UpdateCurrentInstanceGlobal(HeartStoneAcquired)
		if HeartStoneAcquired.GetValue() == 1
			DLC2TTR2.SetStage(200)
			DLC2TTR2.SetObjectiveCompleted(100, true)
			DLC2TTR2.SetObjectiveDisplayed(200, true)
		else
			DLC2TTR2.SetObjectiveDisplayed(100, false)
			DLC2TTR2.SetObjectiveDisplayed(100, true)
		endIf		
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if DLC2TTR2.GetStage() == 200
		HeartStoneAcquired.SetValue(GetActorRef().GetItemCount(DLC2HeartStone))
		if HeartStoneAcquired.GetValue() >= 1
			HeartStoneAcquired.SetValue(1)
		endif
		DLC2TTR2.UpdateCurrentInstanceGlobal(HeartStoneAcquired)
		if HeartStoneAcquired.GetValue() < 1
			DLC2TTR2.SetObjectiveCompleted(100, false)
			DLC2TTR2.SetObjectiveDisplayed(200, false)
			DLC2TTR2.SetObjectiveDisplayed(100, true)
		endIf		
	endif
EndEvent