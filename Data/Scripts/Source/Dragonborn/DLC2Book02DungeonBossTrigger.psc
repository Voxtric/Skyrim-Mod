Scriptname DLC2Book02DungeonBossTrigger extends ObjectReference  

ObjectReference property extraLurker auto

Auto State Waiting
	Event OnTrigger(objectReference Actronaut)
		if Actronaut == game.getplayer()
		 	;player = game.getplayer() as Actor
		 	;Level = player.getLevel()
		 	if game.getPlayer().getLevel() >= 30 
		 		extraLurker.enable()
		 		self.disable()
	 		elseif game.getPlayer().getLevel() < 30
	 		self.disable()
		 	endif
	 	endif
	EndEvent
EndState

;State Done
;EndState