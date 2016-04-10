scriptName DLC1LD_SteamTriggerScript extends ObjectReference
{Script for the steam damage volume triggers in the Aetherium Forge.}

Keyword property DLC1LD_SteamKeyword Auto
Explosion property DLC1LD_SteamTriggerExplosion Auto

Event OnTrigger(objectReference triggerRef)
	if (((TriggerRef as actor) != None) && !(triggerRef as actor).IsDead())
		;If the actor does not already have the steam effect on them
		if !(triggerRef as actor).HasMagicEffectWithKeyword(DLC1LD_SteamKeyword)
 			;debug.Trace(self + " has applied gas to " + triggerRef)
			triggerRef.placeAtMe(DLC1LD_SteamTriggerExplosion)
		endif
	endif
endEvent
