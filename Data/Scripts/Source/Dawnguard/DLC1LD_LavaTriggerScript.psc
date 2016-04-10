scriptName DLC1LD_LavaTriggerScript extends ObjectReference
{Script for the lava damage volumes in the Aetherium Forge.}

Keyword property DLC1LD_LavaKeyword Auto
Explosion property DLC1LD_LavaTriggerExplosion Auto
Spell property DLC1LD_LavaImagespaceSpell Auto

Event OnTriggerEnter(ObjectReference triggerRef)
     if (triggerRef == Game.GetPlayer())
          Game.GetPlayer().AddSpell(DLC1LD_LavaImagespaceSpell, False)
     EndIf
EndEvent

Event OnTriggerLeave(ObjectReference triggerRef)
     if (triggerRef == Game.GetPlayer())
          Game.GetPlayer().RemoveSpell(DLC1LD_LavaImagespaceSpell)
     EndIf
EndEvent

Event OnTrigger(objectReference triggerRef)
	if (((TriggerRef as actor) != None) && !(triggerRef as actor).IsDead())
		;If the actor does not already have this fire effect on them
		if !(triggerRef as actor).HasMagicEffectWithKeyword(DLC1LD_LavaKeyword)
 			;debug.Trace(self + " has applied gas to " + triggerRef)
			triggerRef.placeAtMe(DLC1LD_LavaTriggerExplosion)
		endif
	endif
endEvent
