Scriptname DLC2MH02CampDetectPlayerPresence extends ObjectReference conditional

Quest Property DLC2MH02 auto
bool Property PlayerPresent = false auto conditional

Event OnTriggerEnter(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		PlayerPresent = true
	endif
EndEvent

Event OnTriggerLeave(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		PlayerPresent = false
	endif
EndEvent

Function CheckAttack()
	if (DLC2MH02.GetStage() == 35)
		(DLC2MH02 as DLC2MH02QuestScript).EVPAllRieklings()
	endif
EndFunction
