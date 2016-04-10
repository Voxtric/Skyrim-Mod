Scriptname BYOHBuildingObjectTrophyScript extends BYOHBuildingObjectScript
{script for buildable trophy inventory objects}

; override event on parent script
Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	If akNewContainer == Game.GetPlayer() && akOldContainer == None
		debug.trace(self+" akNewContainer = "+akNewContainer+",  akOldContainer = "+akOldContainer)
		; tell master script that I've been built
		BYOHHouseBuilding.BuildTrophy(ID)
	EndIf
EndEvent


