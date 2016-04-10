Scriptname DLC2MH02EnterThirskTriggerScript extends ObjectReference  


Quest Property DLC2MH02 auto
ReferenceAlias Property Chief auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator != Game.GetPlayer())
		return
	endif
	if (DLC2MH02.IsRunning())
		(DLC2MH02 as DLC2MH02QuestScript).ChiefFGAtStart = true
		Chief.GetActorReference().EvaluatePackage()
		Delete()
	endif
EndEvent
