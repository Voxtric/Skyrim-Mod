ScriptName DLC1CavewormTriggerControlScript extends ObjectReference
{
-	Script that handles both single and multiple caveworms in one location so they act as one
- 	This script lives on the DLC1CavewormTriggerControl and is the parent of all the cave worms in the group
-	Each caveworm is also linkedRef to the DLC1CavewormTriggerControl
}

import debug
import utility

int property iTriggerNumber auto hidden ;increased(onTriggerEnter) and decreased(onTriggerLeave) by the caveworms - if this is > 1, then the worms should be closed
bool property bIsHit = false auto hidden
int property iHitCounter = 0 auto hidden

objectReference myLight

;************************************

auto State waiting
	Event OnActivate(ObjectReference akActionRef)
		myLight = getLinkedRef()
		if(iTriggerNumber > 0)
			myLight.disable()
		else
			myLight.enable()
		endif
	endEvent
endState

;************************************

State gotHit
	Event onBeginState()
		;one of the cave worms got hit
		bIsHit = true
		activate(self)  ;since one of the cave worms got hit, make sure the group closes
						;Note - since this activate is called in this state, it does nothing, it's just used to activate the caveworms
		myLight = getLinkedRef()
		
		if(!myLight.isDisabled())
			myLight.disable()
		endif

		while(iHitCounter > 0)	
			wait(1)
			iHitCounter -= 1  ;each time a cave worm is hit, the counter is reset to 5 by the script on the caveworm
		endWhile

		bIsHit = false
		gotoState("waiting")
		activate(self) ;this activate uses the Waiting state onActivate
	endEvent

	Event onActivate(ObjectReference akActionRef)
		;do nothing
	endEvent

endState

;************************************