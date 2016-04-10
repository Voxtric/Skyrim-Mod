scriptName DLC1VCGargoyleTrackerScript Extends ObjectReference
{This tracks how many of the gargoles in the study have been killed to enable a scene Trigger}


ObjectReference Property RefToEnable Auto

Int Property GargoyleCount = 3 auto
Int Property GargoylesKilled = 0 auto

Function GargoyleKilled()
	GargoylesKilled += 1
	if GargoylesKilled >= GargoyleCount
		RefToEnable.Enable()
	endif
EndFunction
