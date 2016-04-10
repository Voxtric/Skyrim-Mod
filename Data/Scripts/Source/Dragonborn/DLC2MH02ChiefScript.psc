Scriptname DLC2MH02ChiefScript extends ReferenceAlias  



Event OnDeath(Actor akKiller)
	if (GetOwningQuest().GetStage() == 40)
		GetOwningQuest().SetStage(100)
	endif
EndEvent

; Function PlayerAttack()
; 	Debug.Trace("DLC2MH02: Simulating player attack on Riekling chief.")
; 	GetActorReference().SendAssaultAlarm()
; EndFunction

; Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
; 	if (akAggressor == Game.GetPlayer())
; 		PlayerAttack()
; 	endif
; EndEvent

; Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
; 	if (akCaster == Game.GetPlayer())
; 		PlayerAttack()
; 	endif
; EndEvent
