Scriptname DLC2TameDragonEffectScript extends ActiveMagicEffect  
{script for tamed dragon to be placed into tamed alias}

Actor selfActor

auto state begin
Event OnEffectStart(Actor Target, Actor Caster)
	gotoState("done")
; 	debug.trace(self + " OnEffectStart")
	selfActor = Target
	DLC2TameDragon.TameDragon(Target)
endEvent

endState

state done 
	; when player activates, set variable01 which gets rid of ignorecombat package
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			DLC2TameDragon.EndWait()
		endif
	endEvent
endState

; NOTE: this only works when the dragon is on the ground and enters bleedout
Event OnEnterBleedout()
; 	debug.trace(self + "OnEnterBleedout")
	; if this is Miraak's "ferry" dragon, ignore this
	if MQ06FerryDragon.GetActorRef() && selfActor == MQ06FerryDragon.GetActorRef()
; 		debug.trace(self + " Miraak's dragon - do NOT release")
		return
	endif
	; otherwise, release the dragon
	DLC2TameDragon.ReleaseDragon()
endEvent

; NOTE: use OnHit because onEnterBleedout doesn't work when in the air
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)
	if selfActor.GetActorValue("health") <= 1
; 		debug.trace(self + "OnHit at health < 1 by " + akSource)
		; if this is Miraak's "ferry" dragon, ignore this
		if MQ06FerryDragon.GetActorRef() && selfActor == MQ06FerryDragon.GetActorRef()
; 			debug.trace(self + " Miraak's dragon - do NOT release")
			return
		endif
		; otherwise, release the dragon
		DLC2TameDragon.ReleaseDragon()
	endif
endEvent

Event OnDeath(Actor akKiller)
	DLC2TameDragon.DragonDead()
EndEvent

DLC2TameDragonScript Property DLC2TameDragon  Auto  

ReferenceAlias Property MQ06FerryDragon  Auto  
