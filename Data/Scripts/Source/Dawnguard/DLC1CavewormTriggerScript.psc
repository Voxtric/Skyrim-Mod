ScriptName DLC1CavewormTriggerScript extends ObjectReference
{
-	Script that animates the cave worm open or closed based on its control script
-	The caveworms have a trigger baked into the art allowing us to capture onTriggerEnter and Leave events
-	Setup - each caveworm should be activateParented and LinkedRef to the DLC1CavewormTriggerControl
}

import debug
import utility

bool bIsOpen = true ;all the cave worms start out open
DLC1CavewormTriggerControlScript myControl

;************************************

function closeWorm()
	bIsOpen = false
	playAnimation("CloseInstant")
endFunction

function openWorm()
	bIsOpen = true
	playAnimation("OpenInstant")
endFunction

;************************************

Event OnActivate(ObjectReference akActionRef)
	myControl = getLinkedRef() as DLC1CavewormTriggerControlScript
	if((myControl.iTriggerNumber > 0) || (myControl.bIsHit))  ;if there's an actor near the cave worm or one of the cave worms has been hit, close the worm, else open it
		if(bIsOpen)
			closeWorm()
		endif
	else
		if(!bIsOpen)
			openWorm()
		endif
	endif
endEvent

Event onTriggerEnter(objectReference triggerRef)
	myControl = getLinkedRef() as DLC1CavewormTriggerControlScript
	myControl.iTriggerNumber += 1 ;tell the control that somone has entered the caveworm trigger
	myControl.activate(myControl)
endEvent

Event onTriggerLeave(objectReference triggerRef)
	myControl = getLinkedRef() as DLC1CavewormTriggerControlScript
	myControl.iTriggerNumber -= 1 ;tell the control that somone has left the caveworm trigger
	myControl.activate(myControl)
endEvent

Event onHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	myControl = getLinkedRef() as DLC1CavewormTriggerControlScript
	myControl.iHitCounter = 5 ;reset control counter (which counts down to 0) so caveworms previously hit don't open right after being hit again
	if(myControl.getState() == "waiting")
		myControl.gotoState("gotHit")
	endif
endEvent

;************************************