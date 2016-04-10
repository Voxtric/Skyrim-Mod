Scriptname DLC2InitTriggerScript extends ObjectReference  

Quest Property DLC2Init auto

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		DLC2Init.SetStage(100)
		Delete()
	endif
EndEvent
