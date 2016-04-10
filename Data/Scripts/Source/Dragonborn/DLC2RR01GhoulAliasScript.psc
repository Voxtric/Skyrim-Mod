Scriptname DLC2RR01GhoulAliasScript extends ReferenceAlias  Conditional

DLC2RR01QuestScript Property pDLC2RR01QS Auto
GlobalVariable Property pDLC2RR01InvToggled Auto Conditional

Event OnDying(Actor akKiller)

	pDLC2RR01QS.GhoulsDie()

endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)

	if pDLC2RR01InvToggled.GetValue() == 0
		if akAggressor == Game.GetPlayer()
			pDLC2RR01QS.ToggleInvulnerable()
		endif
	endif

endEvent