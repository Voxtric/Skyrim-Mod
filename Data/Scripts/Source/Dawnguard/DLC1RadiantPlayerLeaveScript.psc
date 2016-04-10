Scriptname DLC1RadiantPlayerLeaveScript   extends ReferenceAlias

LocationAlias Property Loc auto

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if GetActorReference().IsInLocation(Loc.GetLocation()) == false
		GetOwningQuest().Stop()
	endif
EndEvent