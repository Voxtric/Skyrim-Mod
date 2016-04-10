scriptName defaultOnActivateNonPlayerEnableScript extends ObjectReference

import game
import debug
import utility

ObjectReference Property RefToBeEnabled auto

auto State WaitingToBeActivated
	EVENT onActivate(ObjectReference triggerRef)
		RefToBeEnabled.enable()
		gotoState("Activated")
	endEVENT
EndState

State Activated
	;Do nothing
EndState