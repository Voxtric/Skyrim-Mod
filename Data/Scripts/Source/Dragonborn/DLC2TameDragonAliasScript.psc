Scriptname DLC2TameDragonAliasScript extends ReferenceAlias  

; when player activates, set variable01 which gets rid of ignorecombat package
Event OnActivate(ObjectReference akActionRef)
	if akActionRef == Game.GetPlayer()
		DLC2TameDragon.EndWait()
	endif
endEvent

;Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
;	debug.trace(self + "OnCombatStateChanged: akTarget=" + akTarget)
;	if akTarget==game.GetPlayer()
;		debug.trace(self + "OnCombatStateChanged: TARGETING PLAYER")
;		; release dragon when he goes into combat with player. Maybe this will work?
;		DLC2TameDragon.ReleaseDragon()
;	endif
;endEvent

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, \
  bool abBashAttack, bool abHitBlocked)
	; if dragon is hostile to player, immediately release
	if akAggressor == Game.GetPlayer() && GetActorRef().IsHostileToActor(Game.GetPlayer())
		DLC2TameDragon.ReleaseDragon()
	endif
endEvent

Event OnDeath(Actor akKiller)
	; release dragon when he dies
	DLC2TameDragon.ReleaseDragon()
endEvent

DLC2TameDragonScript Property DLC2TameDragon  Auto  