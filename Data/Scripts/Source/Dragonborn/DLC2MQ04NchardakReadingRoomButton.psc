Scriptname DLC2MQ04NchardakReadingRoomButton extends ObjectReference  
{variant script for reading room button}

sound property QSTAstrolabeButtonPressX auto
objectReference property objSelf auto hidden
DLC2MQ04Script Property DLC2MQ04 auto

event onCellAttach()
	objSelf = self as objectReference
	; intialize to the "open" state when steam is running
	if DLC2MQ04.bReadingRoomPowered && getState() != "done"
		gotoState("power")
		playAnimation("Open")
	else
		gotoState("noPower")
		playAnimation("Close")
	endif
endEvent



state power
	; reading room has power
	event onActivate(objectReference akActivator)
		goToState("done")
		playAnimationAndWait("Trigger01","done")
		if QSTAstrolabeButtonPressX
			QSTAstrolabeButtonPressX.play(objSelf)
		endif
	endEvent
endState

Auto state noPower
	; waiting for power
endState

state done
	; doesn't do anything
endState