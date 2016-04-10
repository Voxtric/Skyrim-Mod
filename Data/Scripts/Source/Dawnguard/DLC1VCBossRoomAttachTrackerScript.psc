scriptName DLC1VCBossRoomAttachTrackerScript extends ObjectReference
{this tracks when the cell detaches and communicates that to the CastleController}

Quest Property DLC1VCController auto

event onCellDetach()
	(DLC1VCController as DLC1VampireCastleControllerScript).SetBossCellDetached()
endEvent

Event onCellAttach()
	(DLC1VCController as DLC1VampireCastleControllerScript).SetBossCellAttached()
endEvent
