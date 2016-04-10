Scriptname DLC2MQ01Stage20TriggerScript extends ReferenceAlias

Quest Property DLC2MQ01  Auto  


Event OnTriggerEnter(ObjectReference ActionRef)

	if ActionRef == Game.GetPlayer()
		if DLC2MQ01.GetStage() == 10
			DLC2MQ01.SetStage(20)
		endif
	endif

EndEvent