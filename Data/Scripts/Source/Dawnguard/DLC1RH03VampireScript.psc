Scriptname DLC1RH03VampireScript extends ReferenceAlias  
{Script attached to Vampire alias in DLC1RH03}

Event OnDeath(Actor akKiller)
	Debug.Trace(self + "OnDeaht() setting stage 100")
	GetOwningQuest().setStage(100)
EndEvent
