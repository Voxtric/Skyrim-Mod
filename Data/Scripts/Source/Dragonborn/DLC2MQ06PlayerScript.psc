Scriptname DLC2MQ06PlayerScript extends ReferenceAlias
{watch for player to return from Apocrypha to clean up MQ06}

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
; 	debug.trace(self + " akOldLoc=" + akOldLoc)
	; advance quest when player enters Book1 dungeon after stage 100 is set
	if GetOwningQuest().GetStageDone(100) && GetOwningQuest().GetStageDone(200) == false
		if akNewLoc == (GetOwningQuest() as DLC2MQ06Script).DLC2Book01DungeonLocation
			GetOwningQuest().SetStage(200)
		endif
	endif

	; when player leaves Apocrypha after defeating Miraak, clean up MQ06
	if GetOwningQuest().GetStageDone(580) && GetOwningQuest().GetStageDone(600) == false
		if akOldLoc == (GetOwningQuest() as DLC2MQ06Script).DLC2Book01DungeonLocation || akOldLoc == (GetOwningQuest() as DLC2MQ06Script).DLC2ApocrypaMiraaksTowerLocation
			GetOwningQuest().SetStage(600)
		endif
	endif
endEvent