Scriptname DLC1DawnguardRuneAxeDamageEffectSCRIPT extends ActiveMagicEffect  

GLOBALVARIABLE PROPERTY undeadKilled AUTO
KEYWORD PROPERTY undeadType AUTO

OBJECTREFERENCE victim

EVENT OnEffectStart(ACTOR target, ACTOR caster)
	victim = target

ENDEVENT

EVENT OnDying(ACTOR killer)
	if(victim.HasKeyword(undeadType))
		undeadKilled.SetValue(undeadKilled.GetValue() + 1)

	endIf

ENDEVENT

