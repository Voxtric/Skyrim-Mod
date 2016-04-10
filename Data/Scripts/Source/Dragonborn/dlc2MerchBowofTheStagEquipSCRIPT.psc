Scriptname dlc2MerchBowofTheStagEquipSCRIPT extends ObjectReference  

SPELL PROPERTY blessing AUTO

EVENT OnEquipped(ACTOR akActor)
	
	; //if we're the player
	if(akActor == game.getPlayer())
		game.getPlayer().addSpell(blessing)
	endif

ENDEVENT


EVENT OnUnequipped(ACTOR akActor)
	
	; //if we're the player
	if(akActor == game.getPlayer())
		game.getPlayer().removeSpell(blessing)
	endif

ENDEVENT