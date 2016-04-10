Scriptname DLC1BthalftSteamTrigger extends ObjectReference 

Keyword Property LinkKeyword Auto

auto STATE WaitingForHit
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		GoToState("BeenHit")
		PlayAnimationAndWait("open", "done")
		GetLinkedRef(LinkKeyword).Activate(Self)
	EndEvent
ENDSTATE


STATE BeenHit
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;Do Nothing
	EndEvent
ENDSTATE