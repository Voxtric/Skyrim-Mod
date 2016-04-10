Scriptname DLC2MH02BristlebackPenApproach extends ObjectReference  


Quest Property DLC2MH02 auto
ReferenceAlias Property Bilgemuck auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator != Bilgemuck.GetReference())
		return
	endif
	if (DLC2MH02.GetStage() == 15)
		DLC2MH02.SetStage(17)
	endif
EndEvent


