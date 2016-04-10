Scriptname BYOHBuildingObjectExteriorScript extends BYOHBuildingObjectScript

{script for inventory objects used for miscellaneous EXTERIOR building (not the house itself)}

; override event on parent script
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		debug.trace(self+" akNewContainer = "+akNewContainer+",  akOldContainer = "+akOldContainer)
		; get active house right now (in case player moves between houses quickly...)
		int myActiveHouseLocation = BYOHHouseBuilding.activeHouseLocation
		; tell master script that I've been built
		BYOHHouseBuilding.BuildHouseExteriorPart(myActiveHouseLocation, ID, myself)
	EndIf
EndEvent

