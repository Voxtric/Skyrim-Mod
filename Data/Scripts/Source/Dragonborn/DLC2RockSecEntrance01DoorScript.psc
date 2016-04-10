scriptName DLC2RockSecEntrance01DoorScript extends ObjectReference

import debug
import utility

bool property doOnce = false auto
{set true if door should only be activated once
 default = false}

bool opened = false

;****************************

Auto State waiting
	Event onActivate (objectReference triggerRef)
		gotoState ("busy")
		if(!opened)
			opened = true
			playAnimationandWait("Open","Opened")
		else
			opened = false
			playAnimationandWait("Close", "Closed")
		endif

		if(!doOnce)
			gotoState ("waiting")
		endif
	endEvent
endState

;****************************

State busy
	; This is the state when I'm busy animating
		Event onActivate (objectReference triggerRef)
			;do nothing
		endEvent
endState
