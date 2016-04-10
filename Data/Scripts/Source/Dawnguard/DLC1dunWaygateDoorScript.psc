Scriptname DLC1dunWaygateDoorScript extends ObjectReference
{This script lives on each door of a waygate}

import debug
import utility

keyword property LinkCustom01 auto ;my waygate
keyword property LinkCustom02 auto ;the waygate my door connection is part of
keyword property LinkCustom03 auto ;the door I'm connected to
keyword property LinkCustom04 auto ;the door I'm connected to

DLC1dunWaygateScript myWaygate
DLC1dunWaygateScript oppositeWaygate
objectReference oppositeDoor
bool doneActivating = false

;************************************

Event onCellAttach()
	;using this event to play the animation for the door that has been enabled from another wayshrine
	;we know my opposite door has already been enabled and we know now this door in loaded and can now play the animation
	if(doneActivating)
		myWaygate = getLinkedRef(LinkCustom01) as DLC1dunWaygateScript
		oppositeWaygate = getLinkedRef(LinkCustom02) as DLC1dunWaygateScript

		if(myWaygate.bIsReady && oppositeWaygate.bIsReady)
			if(!myWaygate.bLoopingSoundEnabled)
				myWaygate.bLoopingSoundEnabled = true
				myWaygate.myLoopingSound.enable()
			endif
			playAnimation("playAnim02")
		endif
	endif
endEvent

;************************************

auto State waiting
	Event OnActivate(ObjectReference akActionRef)
		;received this event because I'm activate parented to my waygate
		
		myWaygate = getLinkedRef(LinkCustom01) as DLC1dunWaygateScript
		oppositeWaygate = getLinkedRef(LinkCustom02) as DLC1dunWaygateScript
		oppositeDoor = getLinkedRef(LinkCustom03)

		if(myWaygate.bIsReady && oppositeWaygate.bIsReady)
			gotoState("doNothing")
			doneActivating = true
			oppositeWaygate.activate(oppositeWaygate)
			enable(0)
			wait(1.0)
			if(!myWaygate.bLoopingSoundEnabled)
				myWaygate.bLoopingSoundEnabled = true
				myWaygate.myLoopingSound.enable()
			endif
			playAnimation("playAnim02")
			oppositeDoor.enable(0)
			;playing animation for opposite door in the onCellAttach event
		endif

	endEvent
endState

;************************************

State doNothing
	Event onActivate(ObjectReference akActionRef)
		;do nothing
	endEvent
endState
;************************************