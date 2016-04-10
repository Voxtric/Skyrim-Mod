scriptName DLC2dunKillOnPlayerEnterTrig extends objectReference
{kills linked ref when player enters trigger}

import utility
import debug

ObjectReference property myDragonMarker auto

;******************************************************

auto State active
	Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		ObjectReference myMarker = getLinkedRef()
		if(actorRef == game.getPlayer())
			gotoState("done")
			(myMarker as Actor).KillSilent(myMarker as Actor)
		endif
	endEvent
endState

;******************************************************

State done
	; nothing happens here.
endState

;******************************************************