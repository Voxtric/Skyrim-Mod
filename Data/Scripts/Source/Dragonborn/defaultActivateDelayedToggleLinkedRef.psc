scriptName defaultActivateDelayedToggleLinkedRef extends ObjectReference
{
- Toggles the state of the linked ref when this object is activated, with a delay.
}

ObjectReference myLinkedRef
float property EnableDelay Auto
float property DisableDelay Auto
Keyword property LinkKeyword Auto

bool property fade = False Auto

Event OnActivate(ObjectReference triggerRef)
	myLinkedRef = GetLinkedRef(LinkKeyword) as ObjectReference
	if (myLinkedRef.IsEnabled())
		Utility.Wait(DisableDelay)
		myLinkedRef.Disable(fade)
; 		Debug.Trace("Disabled")
	Else
		Utility.Wait(EnableDelay)
		myLinkedRef.Enable(fade)
; 		Debug.Trace("Enabled")
	EndIf
EndEvent
