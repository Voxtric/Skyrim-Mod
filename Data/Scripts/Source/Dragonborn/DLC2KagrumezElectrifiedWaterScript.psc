Scriptname DLC2KagrumezElectrifiedWaterScript extends ObjectReference  

{Script for the shock damage when the player steps in the water during the third Kagrumez fight.}

magicEffect property shockDamageEffect Auto
Explosion property shockDamageExplosion Auto
imagespaceModifier property shockImagespace auto


Event OnTrigger(objectReference triggerRef)
	if (((TriggerRef as actor) != None) && !(triggerRef as actor).IsDead())
		;If the actor does not already have this effect on them
		if !(triggerRef as actor).HasMagicEffect(shockDamageEffect)
;  			;debug.Trace(self + " has applied effect to " + triggerRef)
			triggerRef.placeAtMe(shockDamageExplosion)
			;utility.wait(2)
		endif
	endif
endEvent
