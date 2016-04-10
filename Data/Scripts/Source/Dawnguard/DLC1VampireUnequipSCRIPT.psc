Scriptname DLC1VampireUnequipSCRIPT extends ActiveMagicEffect  

SPELL PROPERTY drainLife AUTO 

BOOL FLOATING=FALSE

; //When the effect begins start looking for the hover event
EVENT OnEffectStart(Actor target, Actor caster)	
	
	IF(caster == game.getPlayer())
		game.getPlayer().addSpell(drainLife)

		IF (registerForAnimationEvent(game.getPlayer(), "GroundStart") == TRUE)
			debug.trace("groundStart REGISTERED")
			
		ENDIF
		IF (registerForAnimationEvent(game.getPlayer(), "LevitateStart") == TRUE)
			debug.trace("levitateStart REGISTERED")
			
		ENDIF
	ENDIF
	

ENDEVENT

; //When we get the event check if we're sneaking and add/remove the 
; //magic as needed
EVENT onAnimationEvent(objectReference source, string eventName)
	
	; //If the player begins to levitate
	IF(eventName == "GroundStart")
		debug.trace("GroundStart happened")

		; //remove the players weapons
		IF(FLOATING)
			game.getPlayer().unequipSpell(drainLife, 0)
			game.getPlayer().unequipSpell(drainLife, 1)

			FLOATING = FALSE

		ENDIF
		
	ELSEIF(eventName == "LevitateStart")
		debug.trace("LevitateStart happened")

		; //dual equip drain life
		IF(!FLOATING)
			game.getPlayer().equipSpell(drainLife, 0)
			game.getPlayer().equipSpell(drainLife, 1)

			FLOATING = TRUE

		ENDIF

	ENDIF

ENDEVENT

; //nothing yet
EVENT OnEffectFinish(Actor akTarget, Actor akCaster)
	debug.trace("over")

ENDEVENT
