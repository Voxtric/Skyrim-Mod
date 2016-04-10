Scriptname BYOHBuildingObjectInteriorScript extends BYOHBuildingObjectScript
{script for inventory objects used for INTERIOR house building}

; override event on parent script
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		debug.trace(self+" akNewContainer = "+akNewContainer+",  akOldContainer = "+akOldContainer)
		; get active house right now (in case player moves between houses quickly...)
		int myActiveHouseLocation = BYOHHouseBuilding.activeHouseLocation
		; get active room right now (in case player moves between workbenches quickly...)
		int myRoomID = BYOHHouseBuilding.activeRoomID

		; tell master script that I've been built
		BYOHHouseBuilding.BuildHouseInteriorPart(myActiveHouseLocation, ID, myself, myRoomID)
	EndIf
EndEvent
