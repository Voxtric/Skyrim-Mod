Scriptname dlc2MKMiraakMaskShoutSCRIPT extends ActiveMagicEffect  

SPELL PROPERTY plague AUTO

EVENT OnEffectStart(ACTOR target, ACTOR caster)
	target.addSpell(plague)

	utility.wait(30)

	target.removeSpell(plague)

ENDEVENT