Scriptname DLC1RV01TargetScript extends ReferenceAlias  
{Script attached to Target alias in DLC1RV01 quest}

;*** Consider moving this into a Kill event quest, so we can see if anyone noticed and called crime - will also need to put him in a crime faction 
Event OnDeath(Actor akKiller)
	GetOwningQuest().setStage(100)
EndEvent