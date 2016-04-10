Scriptname BYOHBuildingRemodelEntryScript extends BYOHBuildingObjectScript
{special script for remodeling entry room}

; override event on parent script
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		debug.trace(self+" akNewContainer = "+akNewContainer+",  akOldContainer = "+akOldContainer)
		; get active house right now (in case player moves between houses quickly...)
		int myActiveHouseLocation = BYOHHouseBuilding.activeHouseLocation
		; tell master script that I've been built
		BYOHHouseBuilding.RemodelEntryRoom(myActiveHouseLocation, ID)
	EndIf
EndEvent

