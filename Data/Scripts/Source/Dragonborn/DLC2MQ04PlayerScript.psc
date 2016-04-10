Scriptname DLC2MQ04PlayerScript  extends ReferenceAlias 

; detect when player enters various locations
Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	; watch for player to exit Tel Mithryn
	if GetOwningQuest().getStageDone(50) == 1 && GetOwningQuest().getStageDone(60) == 0
		if akOldLoc == (GetOwningQuest() as DLC2MQ04Script).DLC2TelMithrynTowerLocation
			GetOwningQuest().SetStage(60)
		endif
	endif

	; watch for player to enter Nchardak
	if GetOwningQuest().getStageDone(50) == 1 && GetOwningQuest().getStageDone(100) == 0
		if akNewLoc == (GetOwningQuest() as DLC2MQ04Script).DLC2NchardakLocation
			GetOwningQuest().SetStage(100)
		endif
	endif


endEvent

