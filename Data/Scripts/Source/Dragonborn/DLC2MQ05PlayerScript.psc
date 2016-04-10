Scriptname DLC2MQ05PlayerScript  extends ReferenceAlias 

; detect when player enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	debug.trace(self + "OnLocationChange: oldLoc=" + akOldLoc + ", newLoc=" + akNewLoc)
	; watch for player to return from Apocrypha
	if GetOwningQuest().getStageDone(100) == true && GetOwningQuest().getStageDone(150) == false
		if akNewLoc == (GetOwningQuest() as DLC2MQ05Script).DLC2NchardakLocation && akOldLoc == (GetOwningQuest() as DLC2MQ05Script).DLC2Book02DungeonLocation
			GetOwningQuest().SetStage(150)
		endif
	endif

	; wait for player to exit Nchardak after talking to HM
	; put this first so it doesn't fire at same time as exiting Apocrypha
	if GetOwningQuest().GetStageDone(355) == true && GetOwningQuest().GetStageDone(370) == false
		if akOldLoc == (GetOwningQuest() as DLC2MQ05Script).DLC2NchardakLocation
			GetOwningQuest().SetStage(370)
		endif
	endif

	; watch for player to exit Apocrypha after talking to HM
	if GetOwningQuest().getStageDone(340) == true && GetOwningQuest().GetStageDone(355) == false
		if akOldLoc == (GetOwningQuest() as DLC2MQ05Script).DLC2Book02DungeonLocation
			GetOwningQuest().SetStage(355)
		endif
	endif

endEvent
