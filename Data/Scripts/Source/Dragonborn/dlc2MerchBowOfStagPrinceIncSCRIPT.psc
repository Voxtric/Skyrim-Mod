Scriptname dlc2MerchBowOfStagPrinceIncSCRIPT extends ActiveMagicEffect  

GLOBALVARIABLE PROPERTY animalsKilled AUTO
KEYWORD PROPERTY animalType AUTO

OBJECTREFERENCE victim

EVENT OnEffectStart(ACTOR target, ACTOR caster)
	victim = target

ENDEVENT

EVENT OnDying(ACTOR killer)
	if(victim.HasKeyword(animalType))
		animalsKilled.SetValue(animalsKilled.GetValue() + 1)

	endIf

ENDEVENT
