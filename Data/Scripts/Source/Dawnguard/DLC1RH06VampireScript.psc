Scriptname DLC1RH06VampireScript extends ReferenceAlias  
{Script attached to Vampire alias in DLC1RH06}

Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(60)
EndEvent