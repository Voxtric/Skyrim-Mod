Scriptname DLC2MiraakAltarActivator extends ObjectReference
{Script for the activators associated with Black Books. Just forwards the activation to the book for handling.}

Event OnInit()
	;Disable follower activation.
	Self.SetNoFavorAllowed(True)
EndEvent

Event OnActivate(ObjectReference akActivator)
	Self.GetLinkedRef().OnActivate(akActivator)
EndEvent