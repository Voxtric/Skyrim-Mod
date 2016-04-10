Scriptname DLC1RH04VampireScript extends ReferenceAlias  
{Script attached to Vampire alias in DLC1RH04}

Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(100)
EndEvent