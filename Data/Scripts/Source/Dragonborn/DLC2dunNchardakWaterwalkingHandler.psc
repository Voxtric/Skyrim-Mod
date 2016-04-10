Scriptname DLC2dunNchardakWaterwalkingHandler extends ObjectReference
{If rising water levels and waterwalking force the player or other actors out of collision in Nchardak, this script, on a kill box, kills them.}

Event OnTrigger(ObjectReference triggerRef)
	(triggerRef as Actor).Kill()
EndEvent