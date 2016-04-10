Scriptname BYOHHouseBuildingPlayerScript extends ReferenceAlias  
{script on player to track player's location}


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	debug.trace(self + ": " + akOldLoc + ", " + akNewLoc)
	(GetOwningQuest() as BYOHHouseBuildingScript).PlayerChangeLocation(akOldLoc, akNewLoc)
EndEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	debug.trace(self + "OnItemAdded " + akBaseItem + ", itemCount=" + aiItemCount)
	(GetOwningQuest() as BYOHHouseBuildingScript).UpdateLogCount()
endEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	debug.trace(self + "OnItemRemoved " + akBaseItem + ", itemCount=" + aiItemCount)
	(GetOwningQuest() as BYOHHouseBuildingScript).UpdateLogCount()
endEvent

; check for DLC01.esm to update vampire lord hate list
Event OnPlayerLoadGame()
	debug.trace(self + " OnPlayerLoadGame...")
	if (GetOwningQuest() as BYOHHouseBuildingScript).bInitializedOtherDLC == false
		(GetOwningQuest() as BYOHHouseBuildingScript).InitializeOtherDLC()
	endif
endEvent
