Scriptname dlc2DBStatBoosterSCRIPT extends ObjectReference  

BOOL PROPERTY healthStone AUTO
MESSAGE PROPERTY healthMessage AUTO

BOOL PROPERTY magickaStone AUTO
MESSAGE PROPERTY magickaMessage AUTO

BOOL PROPERTY staminaStone AUTO
MESSAGE PROPERTY staminaMessage AUTO

BOOL PROPERTY perkStone AUTO
MESSAGE PROPERTY perkMessage AUTO

EVENT onActivate(OBJECTREFERENCE obj)

	; //check to see if the player activated us
	if(obj == game.GetPlayer())

		; //if we're the health stone
		if(healthStone)

			if(healthMessage.Show() == 1)

			endif


		; //if we're the magicka stone
		elseif(magickaStone)

			if(magickaMessage.Show() == 1)

			endif

		; //if we're the stamina stone
		elseif(staminaStone)

			if(staminaMessage.Show() == 1)

			endif

		; //if we're the perk stone
		elseif(perkStone)

			if(perkMessage.Show() == 1)

			endif		

		endif

	endif

ENDEVENT