Scriptname DLC2NelothScript extends Actor  

ObjectReference Property DLC2TelMithrynTowerDoorRef  Auto  

Location Property DLC2TelMithrynTowerLocation  Auto  


Event OnEnterBleedout()
	StopCombat()
EndEvent

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if akNewLoc == DLC2TelMithrynTowerLocation
; 		debug.trace("NELOTH: unlocking door")
		DLC2TelMithrynTowerDoorRef.Lock(false)
	endIf
EndEvent