Scriptname DLC2MH01RieklingScript extends ReferenceAlias  


Event OnDeath(Actor akKiller)
	(GetOwningQuest() as DLC2MH01QuestScript).RieklingKilled()
EndEvent
