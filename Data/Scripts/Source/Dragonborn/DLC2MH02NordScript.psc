Scriptname DLC2MH02NordScript extends ReferenceAlias  




Event OnDeath(Actor akKiller)
	if (GetOwningQuest().GetStage() == 35)
		(GetOwningQuest() as DLC2MH02QuestScript).NordKilled()
	endif
EndEvent
