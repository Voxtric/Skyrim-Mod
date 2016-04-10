Scriptname dlc2BBStopRuneSCRIPT extends ActiveMagicEffect  

FLOAT PROPERTY timer AUTO

EVENT OnEffectStart(ACTOR target, ACTOR caster)
	target.EnableAI(FALSE)

	utility.wait(timer)

	target.EnableAI(TRUE)

ENDEVENT