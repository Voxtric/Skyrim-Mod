Scriptname DLC2EbonyWarriorScript extends Actor  

Ammo Property IronArrow  Auto  

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
	if aeCombatState == 1
		AddItem(IronArrow, 7)
	endif
EndEvent 