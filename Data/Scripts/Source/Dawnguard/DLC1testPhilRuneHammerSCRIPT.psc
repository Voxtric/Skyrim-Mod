Scriptname DLC1testPhilRuneHammerSCRIPT extends ObjectReference  

SPELL PROPERTY runeHammerSpell AUTO
EFFECTSHADER PROPERTY hammerGlow AUTO

BOOL glowOnce=false

EVENT OnLoad()
	
	if(!glowOnce)
		glowOnce = true
		;hammerGlow.play(self)
	endif

ENDEVENT

EVENT OnEquipped(ACTOR akActor)
	
	; //if we're the player
	if(akActor == game.getPlayer())
		game.getPlayer().addSpell(runeHammerSpell, false)
	endif

ENDEVENT


EVENT OnUnequipped(ACTOR akActor)
	
	; //if we're the player
	if(akActor == game.getPlayer())
		game.getPlayer().removeSpell(runeHammerSpell)
	endif

ENDEVENT