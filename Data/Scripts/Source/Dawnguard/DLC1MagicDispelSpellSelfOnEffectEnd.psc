Scriptname DLC1MagicDispelSpellSelfOnEffectEnd extends ActiveMagicEffect  
{This script will cause this magic effect fully dispel on end.  Use it to remove an effect from a spell that that has become inactive.}

Spell Property NameOfParentSpell = none auto
{If you designate a spell here, we will attepmt to dispel that spell instead of just the effect.  Leave this blank if you want only this effect to dispel}

Event OnEffectFinish(Actor Target, Actor Caster)
	if NameOfParentSpell
		Target.dispelSpell(NameOfParentSpell)
	else
		self.dispel()
	endif
EndEvent