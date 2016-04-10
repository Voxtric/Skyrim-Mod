Scriptname DLC2MH01BujoldScript extends ReferenceAlias  



Event OnDeath(Actor akKiller)
	if (GetOwningQuest().GetStage() == 40)
		GetOwningQuest().SetStage(100)
	endif
EndEvent

