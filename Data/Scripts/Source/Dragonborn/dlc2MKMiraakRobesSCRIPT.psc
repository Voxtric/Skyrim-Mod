Scriptname dlc2MKMiraakRobesSCRIPT extends ObjectReference  

SPELL PROPERTY tentacleSpell AUTO

EVENT ONEQUIPPED(ACTOR akActor)

	; //if we're the player
	if(akActor == game.getPlayer())
		game.getPlayer().addSpell(tentacleSpell)
	endif

ENDEVENT

EVENT ONUNEQUIPPED(ACTOR akActor)

	; //if we're the player
	if(akActor == game.getPlayer())
		game.getPlayer().removeSpell(tentacleSpell)
	endif

ENDEVENT