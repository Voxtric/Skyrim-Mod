Scriptname DLC2dunTemOfMiraakButtonScript extends ObjectReference
{sets stage when button is activated}

int property stage auto
{ stage to set}

quest Property myQuest auto
{ quest containing the stage you want to set}

;******************************************************

Auto State waiting
	Event onActivate(objectReference triggerRef)
		gotoState("doNothing")
		myQuest.setStage(stage)
	endEvent

endSTATE

;******************************************************

State doNothing
	Event onActivate(objectReference triggerRef)
	endEvent
endState

;******************************************************