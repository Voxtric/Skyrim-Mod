Scriptname DLC2MH01OutsideBarrowTrigger extends ObjectReference  


Quest Property DLC2MH01 auto
ReferenceAlias Property Bujold auto


Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (DLC2MH01.IsRunning())
			(DLC2MH01 as DLC2MH01QuestScript).PlayerOutsideBarrow = true

			if (DLC2MH01.GetStage() == 27)
				Bujold.GetActorReference().EvaluatePackage()
			endif
		endif
	endif
EndEvent


Event OnTriggerLeave(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		if (DLC2MH01.IsRunning())
			(DLC2MH01 as DLC2MH01QuestScript).PlayerOutsideBarrow = false

			if (DLC2MH01.GetStage() == 27)
				Bujold.GetActorReference().EvaluatePackage()
			endif
		endif
	endif
EndEvent