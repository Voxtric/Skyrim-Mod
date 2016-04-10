Scriptname DLC2ApocryphaConstellationActivator extends ObjectReference
{Script for the constellation activators.}

int property myID Auto
{The ID Number of this constellation (found in its name, and used as an index on the altar array script)}

Event OnInit()
	;Disable follower activation (even though you shouldn't be able to have Followers here).
	Self.SetNoFavorAllowed(True)
EndEvent

Auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		GoToState("Busy")
		(Self.GetLinkedRef() as DLC2MiraakAltarScript).ConstellationActivated(Self, myID)
		GoToState("Waiting")
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do Nothing
	EndEvent
EndState

;We should never get here, but for backwards compatibility with existing saves...
Event OnActivate(ObjectReference akActivator)
	GoToState("Waiting")
	OnActivate(akActivator)
EndEvent