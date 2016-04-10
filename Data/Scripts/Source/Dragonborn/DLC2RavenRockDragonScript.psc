Scriptname DLC2RavenRockDragonScript extends ReferenceAlias  
{Turns on allowing dragon attacks on Raven Rock after the player leaves it the first time}

Location Property DLC2RavenRockLocation  Auto  
Keyword Property LocTypeDwelling  Auto  
WIFunctionsSCript property WI Auto

Keyword Property WIDragonsToggle Auto

State DoneState
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		;do nothing
	EndEvent
endState


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if akOldLoc == DLC2RavenRockLocation && akNewLoc.HasKeyword(LocTypeDwelling) == false
		GoToState("DoneState")
; 		Debug.Trace(self + "OnLocationChange() enabling dragon attacks")
		DLC2RavenRockLocation.SetKeywordData(WIDragonsToggle, 0)
	endif

EndEvent