Scriptname dunWEFXBatActivator extends ObjectReference  
{Runs the bats animation when activated, once only.}

Sound property mySFX auto         ; specify sound fx to play

auto STATE waiting
	Event onActivate(ObjectReference obj)
		;go to an empty state while we take care of the FX
		gotoState("busy")
			
		;take care of FX
		mySFX.play(self)
		playAnimationAndWait("MothTakeoff", "End")
	endEvent
endState

;===============================================

State busy
	;do nothing
EndState
