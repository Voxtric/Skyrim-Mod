Scriptname DLC2MH01PlayerEnterCamp extends ObjectReference  

Quest Property DLC2MHMisc auto
Quest Property DLC2MH01 auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer() && DLC2MHMisc.IsRunning())
		DLC2MHMisc.SetStage(100)
	endif
	if (akActivator == Game.GetPlayer() && DLC2MH01.IsRunning())
		(DLC2MH01 as DLC2MH01QuestScript).PlayerEnteredCamp = true
		Delete()
	endif
EndEvent
