Scriptname dlc2MKMiraakMaskScript extends ObjectReference  

SHOUT PROPERTY tentShout AUTO
WORDOFPOWER PROPERTY tentWord AUTO
MESSAGE PROPERTY tentMSG AUTO
MESSAGE PROPERTY tentRemoveMSG AUTO

EVENT ONEQUIPPED(ACTOR akActor)
	
	if(!game.IsWordUnlocked(tentWord))
		game.unlockWord(tentWord)	
		game.teachWord(tentWord)
	endif

	game.getPlayer().addShout(tentShout)
	game.getPlayer().equipShout(tentShout)
	tentMSG.show()

ENDEVENT

EVENT ONUNEQUIPPED(ACTOR akActor)
	game.getPlayer().removeShout(tentShout)
	game.getPlayer().unequipShout(tentShout)	
	tentRemoveMSG.show()

ENDEVENT