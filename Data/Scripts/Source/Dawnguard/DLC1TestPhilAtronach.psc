Scriptname DLC1TestPhilAtronach extends ACTOR  

SPELL PROPERTY defaultEffect AUTO
SPELL PROPERTY newEffect AUTO

EVENT onload()
	self.removeSpell(defaultEffect)
	self.addSpell(newEffect)
	;self.setAlpha(0.3)

ENDEVENT
