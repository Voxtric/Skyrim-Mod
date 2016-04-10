Scriptname DLC1ClearDrinkingOnCombat extends ReferenceAlias  
{clears drinking animation when combat starts}

Idle Property OffsetStop  Auto  

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	GetActorRef().EvaluatePackage()
	; clear animation
	GetActorRef().PlayIdle(OffsetStop)
endEvent