Scriptname DLC2KagrumezGemScript extends ObjectReference  

miscObject property KagrumezGem01 auto
;miscObject property KagrumezGem02 auto
;miscObject property KagrumezGem03 auto
;miscObject property KagrumezGem04 auto
;miscObject property KagrumezGem05 auto
;Kagrumez gem inventory object 
message property lackItemMessage auto 
message property combatMessage auto 
;Message box to show if the player does not have a gem in inventory
objectReference property consoleMaster auto
;Master object that manages all scripts and sets gauntlet animations in motion
bool property isBusy = false auto hidden
bool property hasGem = false auto hidden
int property gemPosition auto
;identifies the position of the gem this script is attached to. Potential positions are 1-9
int property playerGemCount auto hidden
globalVariable property gemPlacedCount auto 


auto State default
	Event onBeginState()
		self.enable()
	EndEvent
	Event onActivate(objectReference Actronaut)
		playerGemCount = Actronaut.GetItemCount(KagrumezGem01)
		if Actronaut == game.getPlayer() && game.getPlayer().isInCombat() == false
			if isBusy == false && hasGem == false && playerGemCount > gemPlacedCount.getValue()
			;if the player has a gem and this object is not animating, show gem going into the console and go to the "has gem" state. 
			;This also sends an activation event to the Master object in case the gems are in the proper configuration
				isBusy = true
				hasGem = true
				gemPlacedCount.Mod(1)
				consoleMaster.activate(consoleMaster)
				playAnimation("stage1")
				;Actronaut.RemoveItem(KagrumezGem, 1)
				;utility.wait(1)
				;playAnimation("stage2")
				utility.wait(2)
				isBusy = false
		 	elseif isBusy == false && hasGem == true
		 	;If there is a gem already in the slot, the gem is visually removed from the console.
		 		isBusy = true
		 		hasGem = false
		 		;gemPlacedCount
		 		consoleMaster.activate(consoleMaster)
				;gotoState("Waiting")
				playAnimation("reset")
				;Actronaut.AddItem(KagrumezGem, 1)
				gemPlacedCount.Mod(-1)
				utility.wait(2)
				isBusy = false
			elseif hasGem == false && (playerGemCount == 0 || playerGemCount == gemPlacedCount.GetValue())
			 	lackItemMessage.show()
		 	else
		 	;do nothing
			endif
		elseif Actronaut == game.getPlayer() && game.getPlayer().isInCombat() == true
			combatMessage.show()
		endif
	EndEvent
EndState

state fightState
;The activator enters this state during each fight. Removes gem if it has one and blocks activation.
	Event onBeginState()
		if hasGem == true
			hasGem = false
			utility.wait(1)
			playAnimation("reset")
			;game.getPlayer().AddItem(KagrumezGem, 1, true)
			gemPlacedCount.Mod(-1)
		endif
		self.disable()
	EndEvent
	Event onActivate(objectReference Actronaut)
	 ;do nothing
	EndEvent
EndState

