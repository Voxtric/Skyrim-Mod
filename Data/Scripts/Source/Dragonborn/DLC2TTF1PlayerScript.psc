Scriptname DLC2TTF1PlayerScript extends ReferenceAlias  

Quest Property DLC2TTF1  Auto  
Int Property LevelLimit  Auto  
Location Property DLC2TelMithrynLocation  Auto  

Event OnLocationChange(Location akOldLoc, Location akNewLoc )
	if akOldLoc != DLC2TelMithrynLocation || akNewLoc != DLC2TelMithrynLocation
		if game.GetPlayer().GetLevel() >= LevelLimit
			DLC2TTF1.SetStage(5)
		endif
	endif
EndEvent

