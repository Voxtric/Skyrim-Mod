Scriptname DLC1RH01TargetScript extends ReferenceAlias  
{Script attached to Target alias in DLC1RH01}

;*** Consider moving this into a Kill event quest, so we can see if anyone noticed and called crime - will also need to put him in a crime faction 
Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(100)
EndEvent
