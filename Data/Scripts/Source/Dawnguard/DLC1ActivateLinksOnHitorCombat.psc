Scriptname DLC1ActivateLinksOnHitorCombat extends ObjectReference  
{Activates the targeted linked refs when this actors gets hit or goes into combat.}
import game
import debug

keyword property LinkCustom01 auto
bool property doOnce = TRUE auto
{defaults to TRUE}


Event onHit(objectReference akAggressor, Form akWeapon, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (doOnce == FALSE)
		(getLinkedRef(LinkCustom01) as objectReference).activate(self)
		doOnce == TRUE
	endif
endEvent

Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
    if (aeCombatState == 1)
		if (doOnce == FALSE)
			(getLinkedRef(LinkCustom01) as objectReference).activate(self)
			doOnce == TRUE
		endif
    endIf
endEvent

