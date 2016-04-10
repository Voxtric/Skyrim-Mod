Scriptname DLC2FXScribSCRIPT extends activeMagicEffect

;===============================================

import utility
import form

;===============================================
VisualEffect Property FXScribEffect Auto
EffectShader Property FXScribDeathFXShader Auto

int scribHealth 
actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		
		FXScribEffect.Play(selfRef, -1)
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		FXScribEffect.Stop(selfRef)
	endEvent
	
	EVENT OnDeath(actor myKiller)
		scribHealth = selfRef.GetAV("Health") as int
		if scribHealth > 0

				FXScribEffect.Stop(selfRef)
				FXScribDeathFXShader .Play(selfRef)
				wait(1.5)
				
		elseIf scribHealth <= 0

			FXScribEffect.Stop(selfRef)
			
			wait(3)
			
		endIf
	ENDEVENT
	
	