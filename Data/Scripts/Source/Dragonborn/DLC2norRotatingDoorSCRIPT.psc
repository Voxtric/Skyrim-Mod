Scriptname DLC2norRotatingDoorSCRIPT extends ObjectReference  
{script that handles opening and closing of rotating door}

;does it start open
bool property startOpen auto

;******************************************************

Event onCellAttach()
	if(!startOpen)
		playAnimation("SnapOpen")
	else
		playAnimation("SnapClosed")
	endIf
	
endEvent

;******************************************************

auto State Waiting
	Event onActivate (objectReference triggerRef)
		if(!startOpen)
			gotoState("Busy")
			startOpen = true
			playAnimationandWait("RotateClosed", "Trans01")
			gotoState ("Waiting")
		else
			gotoState ("Busy")
			startOpen = false
			playAnimationandWait("RotateOpen", "Trans02")
			gotoState ("Waiting")
		endIf		
	endEvent
endState

;******************************************************

State Busy
	;donothing
endState

;******************************************************