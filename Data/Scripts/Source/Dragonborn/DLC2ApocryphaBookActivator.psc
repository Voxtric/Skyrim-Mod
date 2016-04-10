Scriptname DLC2ApocryphaBookActivator extends ObjectReference
{Script for the activators associated with Black Books. Just forwards the activation to the book for handling.}

Event OnInit()
	;Disable follower activation.
	Self.SetNoFavorAllowed(True)
EndEvent

Event OnActivate(ObjectReference akActivator)
	Self.GetLinkedRef().Activate(akActivator)
EndEvent