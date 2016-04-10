Scriptname dlc2DBBloodOfTheDragonSCRIPT extends ActiveMagicEffect  

GLOBALVARIABLE PROPERTY dbDragonWeapons AUTO

EVENT OnEffectStart(ACTOR target, ACTOR caster)
	dbDragonWeapons.SetValue(1)

ENDEVENT

EVENT OnEffectEnd(ACTOR target, ACTOR caster)
	dbDragonWeapons.SetValue(0)

ENDEVENT