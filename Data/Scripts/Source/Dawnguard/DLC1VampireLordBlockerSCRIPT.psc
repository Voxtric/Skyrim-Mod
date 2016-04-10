Scriptname DLC1VampireLordBlockerSCRIPT extends ObjectReference  

OBJECTREFERENCE PROPERTY collision AUTO
RACE PROPERTY playerRace AUTO

EVENT onTriggerEnter(OBJECTREFERENCE akActor)

	if(game.getPlayer().getRace() == playerRace)
		collision.enable()
	else
		collision.disable()
	endif

ENDEVENT

EVENT onTrigger(OBJECTREFERENCE akActor)

	if(game.getPlayer().getRace() == playerRace)
		collision.enable()
	else
		collision.disable()
	endif

ENDEVENT