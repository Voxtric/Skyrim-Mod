Scriptname DLC2HrothmundsBarrowWaterTrigSCRIPT extends ObjectReference Hidden 

Bool Property bTellControllerToMoveWaterDown Auto

Event OnTriggerEnter(ObjectReference akActionRef)
; 	debug.TracE("Running OnTriggerenter() in check if we should set bMoveWaterDown to " + bTellControllerToMoveWaterDown + " " + self)
	if (GetLinkedRef() as DLC2HrothmundsBarrowWaterSCRIPT).bMoveWaterDown != bTellControllerToMoveWaterDown
; 		debug.Trace("WE SHOULD! Setting bMoveWaterDown to" + bTellControllerToMoveWaterDown + " " + self)
		(GetLinkedRef() as DLC2HrothmundsBarrowWaterSCRIPT).bMoveWaterDown = bTellControllerToMoveWaterDown
		GetLinkedRef().Activate(self)
	else
; 		debug.Trace("WE SHOULD Not!")
	endif

EndEvent