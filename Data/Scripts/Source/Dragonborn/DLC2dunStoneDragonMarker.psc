scriptName DLC2dunStoneDragonMarker extends objectReference
{activated by the stone's trigger when player shouts at it. If dragons are enabled in the world, then this enables it's linked ref}

import utility
import debug

ObjectReference property myDragonMarker auto

;******************************************************

auto State active
	Event onActivate(ObjectReference akActionRef)
		gotoState("done")
		if(myDragonMarker.isEnabled())
			ObjectReference myLinkedRef = self.getLinkedRef()
			myLinkedRef.enable()
		endif
	endEvent
endState

;******************************************************

State done
	; nothing happens here.
endState

;******************************************************