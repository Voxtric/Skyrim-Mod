Scriptname DLC1VQ08HarkonHandlerScript extends ReferenceAlias  Conditional

Quest Property pDLC1VQ08 Auto

;Event OnDying(Actor akKiller)
	;Setting Stage 200 is now handled by the DLC1dunHarkonBossBattle script once Harkon has dissolved.
	;Harkon's dissolve is now being handled by his combat script.
	;So nothing remains to be done here.
;EndEvent

Event OnCellLoad()
	GoToState("Ready")
EndEvent

State Ready
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if (akAggressor == Game.GetPlayer() && pDLC1VQ08.IsRunning() == 1)
			GoToState("Done")
			if pDLC1VQ08.GetStageDone(60) == 0
				pDLC1VQ08.SetStage(60)
			endif
		endif
	EndEvent
EndState

State Done
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;Do nothing.
	EndEvent
EndState