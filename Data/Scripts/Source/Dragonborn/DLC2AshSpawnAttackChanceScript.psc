Scriptname DLC2AshSpawnAttackChanceScript extends ReferenceAlias  
{watches for player changing location, then turns on the ash spawn attacks by setting AshSpawnAttackChance global}

GlobalVariable Property DLC2AshSpawnAttackChance auto
Location Property DLC2RavenRockLocation auto
Keyword Property LocTypeDwelling auto

State DoneState
	Event OnLocationChange(Location akOldLoc, Location akNewLoc)
		;do nothing
	EndEvent
endState


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if akOldLoc == DLC2RavenRockLocation && akNewLoc.HasKeyword(LocTypeDwelling) == false
		GoToState("DoneState")
; 		Debug.Trace(self + "OnLocationChange() settomg DLC2AshSpawnAttackChance to 100")
		DLC2AshSpawnAttackChance.SetValue(100) ; set to lower after the first time it runs
	endif

EndEvent