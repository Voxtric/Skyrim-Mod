Scriptname DLC1VQ01PuzzleButtonScript extends ObjectReference  

ObjectReference property puzzleController auto
message property combatMessage auto

Quest property DLC1VQ01 auto
 topic property playerHitSound auto

auto State Waiting
	Event onActivate(objectReference triggerRef)
		if triggerRef == game.getPlayer() && game.getplayer().IsinCombat() == 0
			puzzleController.Activate(puzzleController)
			DLC1VQ01.SetStage(19) ; tell quest puzzle has been triggered
			self.blockActivation(true)
			utility.wait(3)
			game.getplayer().say(playerHitSound, abSpeakInPlayersHead = true)
			triggerRef.RampRumble(0.1, 1, 64)
			gotoState("done")
		elseif game.getplayer().IsinCombat() == 1
			;combatMessage.show()
		endif
	EndEvent
endState 

state done
	Event onActivate(objectReference triggerRef)
	;do nothing
	EndEvent
endState