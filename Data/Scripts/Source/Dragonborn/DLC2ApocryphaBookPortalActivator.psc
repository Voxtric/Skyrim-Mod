Scriptname DLC2ApocryphaBookPortalActivator extends ObjectReference
{Script for the portal activator associated with Black Books. Just forwards the activation back to the book for handling.}

ObjectReference property Controller auto Hidden

Event OnInit()
	;Disable follower activation.
	Self.SetNoFavorAllowed(True)
EndEvent

Event OnActivate(ObjectReference akActivator)
	Controller.OnActivate(Self)
EndEvent

Function SetController(ObjectReference newController)
	controller = newController
EndFunction