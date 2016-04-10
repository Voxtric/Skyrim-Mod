Scriptname dlc2DBPerkActivatorSCRIPT extends ObjectReference  

MESSAGE PROPERTY perk1MSG AUTO
BOOL PROPERTY perk1ACT AUTO
OBJECTREFERENCE PROPERTY perk1Orb AUTO

MESSAGE PROPERTY perk2MSG AUTO
BOOL PROPERTY perk2ACT AUTO
OBJECTREFERENCE PROPERTY perk2Orb AUTO

MESSAGE PROPERTY perk3MSG AUTO
BOOL PROPERTY perk3ACT AUTO
OBJECTREFERENCE PROPERTY perk3Orb AUTO

MESSAGE PROPERTY perk4MSG AUTO
BOOL PROPERTY perk4ACT AUTO
OBJECTREFERENCE PROPERTY perk4Orb AUTO

MESSAGE PROPERTY perk5MSG AUTO
BOOL PROPERTY perk5ACT AUTO
OBJECTREFERENCE PROPERTY perk5Orb AUTO

MESSAGE PROPERTY perk6MSG AUTO
BOOL PROPERTY perk6ACT AUTO
OBJECTREFERENCE PROPERTY perk6Orb AUTO

MESSAGE PROPERTY perk7MSG AUTO
BOOL PROPERTY perk7ACT AUTO
OBJECTREFERENCE PROPERTY perk7Orb AUTO

MESSAGE PROPERTY perk8MSG AUTO
BOOL PROPERTY perk8ACT AUTO
OBJECTREFERENCE PROPERTY perk8Orb AUTO

MESSAGE PROPERTY rejectMSG AUTO

EVENT onActivate(OBJECTREFERENCE obj)
	
	; //only care about the player
	if(obj == game.GetPlayer())
		
		; //if the player has selected the first perk
		if(perk1ACT)

			; //enable the first orb
			perk1Orb.enable()

		; //if the player has selected the second perk (first branch to left)
		elseif(perk2ACT)

			; //do we have the first perk?
			if(perk1Orb.isEnabled())
				perk2Orb.enable()

			endif

		; //if the player has selected the third perk (Up the middle)
		elseif(perk3ACT)

			; //do we have the first perk?
			if(perk1Orb.isEnabled())
				perk3Orb.enable()

			endif		

		; //if the player has selected the fourth perk (branch to the right)
		elseif(perk4ACT)

			; //do we have the first perk?
			if(perk1Orb.isEnabled())
				perk4Orb.enable()

			endif				

		; //if the player has selected the fifth perk (second perk in the left branch)
		elseif(perk5ACT)

			; //do we have perk 2?
			if(perk2Orb.isEnabled())
				perk5Orb.enable()
			endif

		; //if the player has selected the sixth perk (up the middle)
		elseif(perk6ACT)

			; //do we have perk 2?
			if(perk3Orb.isEnabled())
				perk6Orb.enable()
			endif		

		; //if the player has selected the seventh perk (branch to the right)
		elseif(perk7ACT)

			; //do we have perk 4?
			if(perk4Orb.isEnabled())
				perk7Orb.enable()
			endif		

		; //if the player has selected the eighth perk
		elseif(perk8ACT)

			; //do we have perk 6?
			if(perk6Orb.isEnabled())
				perk8Orb.enable()
			endif

		endif


	endif


ENDEVENT