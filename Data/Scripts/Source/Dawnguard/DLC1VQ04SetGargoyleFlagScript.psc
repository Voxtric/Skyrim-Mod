Scriptname DLC1VQ04SetGargoyleFlagScript extends ObjectReference  


Quest Property DLC1VQ04RNPC auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		(DLC1VQ04RNPC as DLC1VQ04RNPCQuestScript).EncounteredGargoyle = true
		Delete()
	endif
EndEvent
