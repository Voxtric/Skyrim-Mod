Scriptname DLC1RH02BossScript extends ReferenceAlias  
{Script on Boss alias in DLC1RH02}

Event OnDeath(Actor akKiller)
	GetOwningQuest().SetStage(100)
EndEvent