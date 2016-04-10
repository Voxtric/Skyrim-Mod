Scriptname DLC1FXDeathHoundSCRIPT extends activeMagicEffect

;===============================================

import utility
import form

;===============================================
VisualEffect Property FXDeathHoundEffect Auto
EffectShader Property DeathHoundDeathFXShader Auto

int houndHealth 
actor selfRef

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		
		FXDeathHoundEffect.Play(selfRef, -1)
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		FXDeathHoundEffect.Stop(selfRef)
	endEvent
	
	EVENT OnDeath(actor myKiller)
		houndHealth = selfRef.GetAV("Health") as int
		if houndHealth > 0

				FXDeathHoundEffect.Stop(selfRef)
				DeathHoundDeathFXShader.Play(selfRef)
				wait(1.5)
				
		elseIf houndHealth <= 0

			FXDeathHoundEffect.Stop(selfRef)
			
			wait(3)
			
		endIf
	ENDEVENT
	
	