Scriptname dlc2MerchMerchantSchedule extends ObjectReference  

GLOBALVARIABLE PROPERTY gameTime AUTO

EVENT onCellAttach()
; 	debug.trace(self + "OnCellAttach")
	CheckForEnableDisable()
ENDEVENT

EVENT onCellDetach()
	CheckForEnableDisable()
ENDEVENT

function CheckForEnableDisable()
	; //check to see if we should enable/disable
	if(gameTime.getValue() >= 0 && gameTime.getValue() <= 4)
		enable()
	else
		disable()
	endif
endFunction