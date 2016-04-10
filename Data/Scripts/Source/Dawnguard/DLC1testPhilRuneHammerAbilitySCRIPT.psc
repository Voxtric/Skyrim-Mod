Scriptname DLC1testPhilRuneHammerAbilitySCRIPT extends ActiveMagicEffect  

SPELL PROPERTY runeSpell AUTO

EVENT OnEffectStart(Actor target, Actor caster)	
	
	if(caster == game.getPlayer())
		if(RegisterForAnimationEvent(game.getPlayer(), "bashExit") == true)
			debug.trace("bashExit registered")
		endif
	
	endif

ENDEVENT

EVENT OnAnimationEvent(ObjectReference akSource, string asEventName)
  
  	if(asEventName == "bashExit")
  		Debug.trace("the RUNE of me... get it?")

  		; //cast the rune and remove the stamina
  		runeSpell.cast(game.getPlayer())
  		game.getPlayer().damageAv("stamina", 25)

	endIf

ENDEVENT

EVENT OnUnload()
	UnregisterForAnimationEvent(game.getPlayer(), "bashExit")
	
ENDEVENT