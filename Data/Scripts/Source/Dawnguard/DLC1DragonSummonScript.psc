Scriptname DLC1DragonSummonScript extends ObjectReference  
{script for summoned dragon to trigger scenes}

Actor selfActor

auto state begin
event OnLoad()
	gotoState("done")
	debug.trace(self + " onLoad")
	selfActor = (self as ObjectReference) as Actor
	DLC1VQDragon.InitializeSummon(self as ObjectReference)
endEvent

endState

state done 
	; when player activates, set variable01 which gets rid of ignorecombat package
	Event OnActivate(ObjectReference akActionRef)
		if akActionRef == Game.GetPlayer()
			DLC1VQDragon.EndSummonWait()
		endif
	endEvent
endState

; NOTE: this only works when the dragon is on the ground and enters bleedout
Event OnEnterBleedout()
	debug.trace(self + "OnEnterBleedout")
	DLC1VQDragon.DispelDragon()
endEvent

; NOTE: use OnHit because onEnterBleedout doesn't work when in the air
Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)
	if selfActor.GetActorValue("health") <= 1
		debug.trace(self + "OnHit at health < 1")
		DLC1VQDragon.DispelDragon()
	endif
endEvent

Event OnDeath(Actor akKiller)
	DLC1VQDragon.DragonDead()
EndEvent

DLC1VQDragonScript Property DLC1VQDragon  Auto  
