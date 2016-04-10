Scriptname DLC1RV04VampireScript extends ReferenceAlias  
{Script attached to Vampire alias in DLC1RV04 quest}

Event OnDeath(Actor akKiller)
	Debug.Trace(self + "OnDeaht() setting stage 100")
	GetOwningQuest().setStage(100)
EndEvent