Scriptname DLC2TTR4bPlayerScript extends ReferenceAlias  

Quest Property DLC2TTR4b  Auto  
Location Property DLC2TelMithrynLocation  Auto  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	If akOldLoc == DLC2TelMithrynLocation
		DLC2TTR4b.SetStage(300)
	endIf
EndEvent
