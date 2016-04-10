Scriptname DLC1zFVPOIEntraceTrigSCRIPT extends ObjectReference Hidden 



Event onTriggerEnter(ObjectReference triggerRef)

	utility.Wait(0.0)
	GetLinkedRef().Disable()
		
EndEvent


Event onTriggerLeave(ObjectReference triggerRef)

	GetLinkedRef().Enable()
		
EndEvent