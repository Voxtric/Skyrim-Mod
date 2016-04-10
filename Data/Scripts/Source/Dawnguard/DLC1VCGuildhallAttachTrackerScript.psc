scriptName DLC1VCGuildhallAttachTrackerScript extends ObjectReference
{this tracks when the cell attaches and tells the CastleController to store the Point of Reference XYZ}

Quest Property DLC1VCController auto

Event onCellAttach()
	(DLC1VCController as DLC1VampireCastleControllerScript).SetGuildhallCellAttached()
endEvent

Event onCellDetach()
	(DLC1VCController as DLC1VampireCastleControllerScript).SetGuildhallCellDetached()
endEvent