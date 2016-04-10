Scriptname DLC2AshHopperScript extends Actor  

SPELL Property VoiceUnrelentingForce3  Auto  

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if akSource == VoiceUnrelentingForce3
		kill()
	endif
EndEvent