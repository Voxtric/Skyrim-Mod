Scriptname dlc2DBAncientDragonbornAggroSCRIPT extends activemagiceffect  

EVENT OnEffectStart(ACTOR target, ACTOR caster)
	
	target.stopCombat()
	target.startCombat(caster)

ENDEVENT