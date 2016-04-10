Scriptname DLC1dunWaygateScript extends ObjectReference

import game
import utility
import debug

bool property bIsReady = false auto
{default = false}

bool property bMoveMapMarker = false auto
{If true when this wayshrine rises it'll move it's The 1st LinkRef in the chain the 2nd(MapMarker's xMarkerHeading), and the 3rd(MapMarker Itself) to the wayshrine itself. (default = false)}

objectReference property myLoopingSound auto

bool property bLoopingSoundEnabled = false auto

bool property waiting = false auto

;************************************

auto State waiting
	Event OnActivate(ObjectReference akActionRef)
		gotoState("ready")
		if(!bIsReady)
			;self.RampRumble(1, 2, 1600)
			playAnimation("playanim02")
			ShakeCamera(self, 0.3, 2)
			ShakeController(0.7, 0.7, 2)
			wait(2)
			ShakeCamera(self, 0.4, 2)
			ShakeController(0.5, 0.5, 2)
			wait(2)

			if (bMoveMapMarker)
				;This will move the Map Marker's xMarkerHeading to it's own LinkedRef
				GetLinkedRef().MoveTo(GetLinkedRef().GetLinkedRef())
				;This will move the Map Marker itself to the origin of this Wayshrine
				(GetLinkedRef().GetLinkedRef().GetLinkedref()).MoveTo(self)
			endif

			bIsReady = true
		endif
		
		if(!waiting)  ;this is to handle the first wayshrine where we don't want the portal to be enabled right away, the quest handles the activation
			activate(self)
		endif


	endEvent
endState

;************************************

State ready
	Event onActivate(ObjectReference akActionRef)
		;now that the waygate is up and ready, we need to talk to each of our doors when pinged (activated)
		;this activate blocks serves that purpose because each of the doors is activate parented to me

	endEvent
endState
;************************************