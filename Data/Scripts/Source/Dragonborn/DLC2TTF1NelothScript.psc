Scriptname DLC2TTF1NelothScript extends ReferenceAlias  

ObjectReference Property DLC2TelMithrynTowerDoorRef  Auto  

Location Property DLC2TelMithrynTowerLocation  Auto  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if akNewLoc == DLC2TelMithrynTowerLocation
		DLC2TelMithrynTowerDoorRef.Lock(false)
	endIf
EndEvent
