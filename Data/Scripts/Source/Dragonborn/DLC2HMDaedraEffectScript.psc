Scriptname DLC2HMDaedraEffectScript extends activemagiceffect  


import utility
import form

;===============================================

Actor selfRef
EffectShader Property DLC2HMDaedraFXS Auto
EffectShader Property DLC2HMDaedraDeathFXS Auto
EffectShader Property DLC2HMDaedraUnsummonDeathFXS Auto
explosion property DLC2HMDaedraDeathExplosion auto
int daedraHealth 

	EVENT OnEffectStart(Actor Target, Actor Caster)	
		selfRef = caster
		DLC2HMDaedraFXS.Play(selfRef, -1)
	ENDEVENT
	
	Event OnEffectFinish(Actor akTarget, Actor akCaster)
		DLC2HMDaedraFXS.Stop(selfRef)
	ENDEVENT
	
	EVENT onDying(actor myKiller)
		daedraHealth = selfRef.GetAV("Health") as int
		if daedraHealth > 0
; 			debug.trace("flame health  > 0")
			DLC2HMDaedraFXS.Stop(selfRef)
			DLC2HMDaedraUnsummonDeathFXS.Play(selfRef)
		elseIf daedraHealth <= 0
			DLC2HMDaedraDeathFXS.Play(selfRef)
			;wait(1.0)
			selfRef.placeAtMe(DLC2HMDaedraDeathExplosion)
			DLC2HMDaedraFXS.Stop(selfRef)
			DLC2HMDaedraDeathFXS.Stop(selfRef)
		endif
	ENDEVENT
	