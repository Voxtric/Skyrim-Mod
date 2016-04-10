Scriptname DLC2FXScrib extends activemagiceffect  


import utility
import form

;===============================================

Actor selfRef
EffectShader Property DLC2ScribDeathFXS Auto
int scribHealth 

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		
	ENDEVENT
	
	EVENT onDying(actor myKiller)
		scribHealth = selfRef.GetAV("Health") as int
		if scribHealth > 0
; 			debug.trace("flame health  > 0")
			
		elseIf scribHealth <= 0
			
; 			debug.trace("flame health  <= 0")
			DLC2ScribDeathFXS.Play(selfRef)
			wait (0.2)
			DLC2ScribDeathFXS.Stop(selfRef)
		endif
	ENDEVENT
	
