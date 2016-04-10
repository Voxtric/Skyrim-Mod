Scriptname DLC2RieklingRescuePlayerScript extends ReferenceAlias  
{Attached to Player alias in DLC2RieklingRescue quest}

bool WasProjectile
Keyword Property WeapTypeBow auto

State ProcessingHit
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;DO NOTHING
	EndEvent

	Event OnBeginState()
; 		debug.trace(self + "ProcessingHit OnBeginState() Calling RollForRieklings() and RegisterForSingleUpdate() to reset OnHit Event Capture")
; 		debug.trace(self + "ProcessingHit OnBeginState() WasProjectile: " + WasProjectile)
		
		(GetOwningQuest() as DLC2RieklingRescueScript).RollForRieklings(WasProjectile)
		RegisterForSingleUpdate(120)

	EndEvent

EndState

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	WasProjectile = akProjectile || akSource.HasKeyword(WeapTypeBow)

	GotoState("ProcessingHit")

; 	debug.trace(self + "OnHit() akProjectile: " + akProjectile)
; 	debug.trace(self + "OnHit() akSource: " + akSource)
; 	debug.trace(self + "OnHit() WasProjectile: " + WasProjectile)
EndEvent

Event OnUpdate()
	GotoState(None)
; 	debug.trace(self + "OnUpdate() called GotoState(None) so we can register for OnHit events")

EndEvent

