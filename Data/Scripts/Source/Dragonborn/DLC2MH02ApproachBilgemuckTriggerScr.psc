Scriptname DLC2MH02ApproachBilgemuckTriggerScr extends ObjectReference  


Quest Property DLC2MH02 auto
ReferenceAlias Property Bilgemuck auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator != Game.GetPlayer())
		return
	endif
	if (DLC2MH02.GetStage() == 10)
		(DLC2MH02 as DLC2MH02QuestScript).BilgemuckFollow = true
		Bilgemuck.GetActorReference().EvaluatePackage()
		DLC2MH02.SetStage(15)
		Delete()
	endif
EndEvent
