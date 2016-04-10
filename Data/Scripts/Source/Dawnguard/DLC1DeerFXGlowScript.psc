ScriptName DLC1DeerFXGlowScript extends ActiveMagicEffect
{Script that plays an FX animation on the DLC1Deer based on several different events}

import debug
import utility

Actor selfRef
bool bHit = false
int iHitCounter = 0
bool bAggressive = false


;;;;;;;;;;;;;;;;Mark removed all calls to flashing anims
;************************************

EVENT OnEffectStart(Actor akTarget, Actor akActor)
	selfRef = akActor
	RegisterForSingleLOSGain(selfRef, Game.GetPlayer() as ObjectReference)
ENDEVENT

;************************************

Event onUpdate()
	while(bHit && iHitCounter > 0)
		wait(1)
		iHitCounter -= 1
	endWhile
	bHit = false
;	selfRef.playSubGraphAnimation("noFlash")
endEvent

;************************************

auto State Waiting

	Event OnDeath(Actor akKiller)
		;need to stop any effects that are playing
		gotoState("doNothing")
		bHit = false
		iHitCounter = 0
;		selfRef.playSubGraphAnimation("noFlash")
		selfRef.playSubGraphAnimation("noGlow")
	endEvent

	Event OnCombatStateChanged(Actor akTarget, int aeCombatState)
		;we'll only get this event if the deer is frenzied
		if(aeCombatState > 0)
			bAggressive = true
			selfRef.playSubGraphAnimation("glowRed")
		else
			bAggressive = false
		endif
	endEvent

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		if((bAggressive) || (selfRef.getActorValue("Health") <= 20))
;			selfRef.playSubGraphAnimation("flashRed")
		else
;			selfRef.playSubGraphAnimation("flash")
		endif

		iHitCounter = 6

		if(!bHit)
			bHit = true
			RegisterForSingleUpdate(1)
		endif
	endEvent

	Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
		if(!bHit)
			if(bAggressive)
				selfRef.playSubGraphAnimation("glowRed")
			else
				selfRef.playSubGraphAnimation("glow")
			endif
		endif
		wait(5)
		RegisterForSingleLOSLost(selfRef, Game.GetPlayer() as ObjectReference)
	endEvent

	Event OnLostLOS(Actor akViewer, ObjectReference akTarget)
		selfRef.playSubGraphAnimation("noGlow")
;		selfRef.playSubGraphAnimation("noFlash")
		RegisterForSingleLOSGain(selfRef, Game.GetPlayer() as ObjectReference)
	endEvent

endState

;************************************

State doNothing
	Event onBeginState()
		;safety check to make sure no FX are playing
		bHit = false
		iHitCounter = 0
;		selfRef.playSubGraphAnimation("noFlash")
		selfRef.playSubGraphAnimation("noGlow")
	endEvent

	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;do nothing
	endEvent

	Event OnGainLOS(Actor akViewer, ObjectReference akTarget)
		;do nothing
	endEvent

	Event OnLostLOS(Actor akViewer, ObjectReference akTarget)
		;do nothing
	endEvent

endState

;************************************