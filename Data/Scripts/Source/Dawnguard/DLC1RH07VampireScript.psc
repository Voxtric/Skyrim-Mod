Scriptname DLC1RH07VampireScript extends ReferenceAlias  
{Script attached to Vampire alias in DLC1RH07}

Event OnDeath(Actor akKiller)
	Debug.Trace(self + "OnDeath() setting stage 100")
	GetOwningQuest().SetStage(100)
EndEvent