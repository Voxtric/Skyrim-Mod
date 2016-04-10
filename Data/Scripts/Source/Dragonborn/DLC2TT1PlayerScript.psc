Scriptname DLC2TT1PlayerScript extends referencealias

Location Property DLC2RavenRockLocation  Auto  
Location Property DLC2TelMithrynLocation  Auto  
Quest Property DLC2TT1  Auto  

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	Debug.Trace("DLC2TT1: player alias changed location, old Loc = " + akOldLoc)
	if akNewLoc != DLC2TelMithrynLocation && akNewLoc != DLC2TelMithrynTowerLocation && akNewLoc != DLC2TelMithryApothecaryLocation	 && akNewLoc != DLC2TelMithrynStewardLocation && akNewLoc != DLC2TelMithrynKitchenLocation
		if DLC2TT1.GetStageDone(90) == true
			DLC2TT1.SetStage(100)
		endif
	endif
EndEvent

Location Property DLC2TelMithryApothecaryLocation  Auto  

Location Property DLC2TelMithrynStewardLocation  Auto  

Location Property DLC2TelMithrynKitchenLocation  Auto  

Location Property DLC2TelMithrynTowerLocation  Auto  
