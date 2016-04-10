scriptName DLC2dunEnableOnStageDone extends objectReference
{enables linked ref only when quest stage is done}

import debug

Quest property myQuest auto
int property myStage auto
{the stage that needs to be done before enabling}

;******************************************************

auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		ObjectReference myMarker = getLinkedRef()
		if(actorRef == game.getPlayer()) && (myQuest.getStageDone(myStage))
			gotoState("done")
			myMarker.enable()
		endif
	endEvent
endState

;******************************************************

State done
	; nothing happens here.
endState

;******************************************************