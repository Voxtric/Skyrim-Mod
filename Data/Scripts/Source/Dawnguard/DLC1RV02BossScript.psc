Scriptname DLC1RV02BossScript extends ReferenceAlias  
{Script on Boss alias in DLC1RV02 quest}

Event OnDeath(Actor akKiller)
	GetOwningQuest().SetStage(100)
EndEvent