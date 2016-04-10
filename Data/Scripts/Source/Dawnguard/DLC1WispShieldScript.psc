Scriptname DLC1WispShieldScript extends ActiveMagicEffect  
import Debug
import Utility

Spell Property DLC1AbKeeperWispCloak Auto

MagicEffect Property DLC1PCVampireAbsorbHealthConcAimed  Auto  
MagicEffect Property DLC1SunDamageFFAimedArea  Auto  
MagicEffect Property DLC1SunDamageFFAimed Auto
MagicEffect Property DLC1PCVampireAbsorbHealthFFAimed Auto

VisualEffect Property FXDLC1SCKeeperEffect auto

actor selfRef

EVENT OnEffectStart(Actor Target, Actor Caster)	
	selfRef = caster	
	FXDLC1SCKeeperEffect.play(selfRef, -1)
ENDEVENT

Event OnEffectFinish(Actor akTarget, Actor akCaster)		
	FXDLC1SCKeeperEffect.Stop(selfRef)
ENDEVENT

EVENT OnDying(actor myKiller)	
	FXDLC1SCKeeperEffect.stop(selfRef)
ENDEVENT
	
Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
	;Notification("Effect Applies" + akeffect)
	debug.trace("Effect Applies" + akeffect)
	Actor Keeper = Self.GetTargetActor()
	if (akEffect == DLC1SunDamageFFAimed || akEffect == DLC1SunDamageFFAimedArea || akEffect == DLC1PCVampireAbsorbHealthConcAimed || akeffect == DLC1PCVampireAbsorbHealthFFAimed)
		Dispel()
		Keeper.RemoveSpell(DLC1AbKeeperWispCloak)
		;wait(Timer)
		;Keeper.AddSpell(DLC1AbKeeperWispCloak)
	endif
endEvent




;/ FormList Property DLC1SoulCairnWispSpellsList  Auto  
;FormList Property DLC1SoulCairnWispSpellsListDG  Auto  
;FormList Property DLC1SoulCairnWispSpellsListVamp  Auto  

Spell Property DLC1AbKeeperWispCloak Auto

int Property Timer Auto 
;used if we want to give back the ability after a certain time

Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	;Notification("Wisp Shield Hit")
	Actor Keeper = Self.GetTargetActor()
	spell hitSpell = akSource as Spell
	int counter = 0
	while (counter < DLC1SoulCairnWispSpellsList.GetSize())
		spell listSpell = DLC1SoulCairnWispSpellsList.GetAt(counter) as spell
		if (listSpell == hitSpell)
			Dispel()
			Keeper.RemoveSpell(DLC1AbKeeperWispCloak)
			;wait(Timer)
			;Keeper.AddSpell(DLC1AbKeeperWispCloak)
		endIf
		counter += 1
	endWhile
endEvent /;