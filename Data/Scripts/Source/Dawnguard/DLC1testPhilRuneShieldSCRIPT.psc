Scriptname DLC1testPhilRuneShieldSCRIPT extends ObjectReference  

SPELL PROPERTY runeShieldSpell AUTO

EVENT OnEquipped(ACTOR akActor)
	
	; //if we're the player
	if(akActor == game.getPlayer())
		game.getPlayer().addSpell(runeShieldSpell, false)
	endif

ENDEVENT


EVENT OnUnequipped(ACTOR akActor)
	
	; //if we're the player
	if(akActor == game.getPlayer())
		game.getPlayer().removeSpell(runeShieldSpell)
	endif

ENDEVENT