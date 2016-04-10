Scriptname DLC2dunKolbjornStairLeverScript extends ObjectReference
{In Kolbjorn Barrow, make absolutely sure the grating gets disabled before we raise the stair platform.}

Keyword property LinkCustom01 Auto
Keyword property LinkCustom02 Auto

Auto State Waiting
	Event OnActivate(ObjectReference obj)
		GoToState("Done")
		Self.GetLinkedRef(LinkCustom01).Disable()
		Self.GetLinkedRef(LinkCustom02).Activate(obj)
	EndEvent
EndState

State Done
	Event OnActivate(ObjectReference obj)
		;Do nothing.
	EndEvent
EndState

