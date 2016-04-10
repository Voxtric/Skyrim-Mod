Scriptname DLC2ThirskFFHilundPlayerScript extends ReferenceAlias


ObjectReference Property FenceEnabler auto

Location[] Property ExcludedLocations auto


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if (GetOwningQuest().GetStage() == 200)
		if (akNewLoc == None)
			return
		endif
		
		int count = 0
		while (count < ExcludedLocations.length)
			if (akNewLoc == ExcludedLocations[count])
				return
			endif
			count += 1
		endwhile

; 		Debug.Trace("DLC2FFHilund: Enabling fence on completion and player not being around.")
		FenceEnabler.Enable()
		GetOwningQuest().Stop()
	endif
EndEvent
