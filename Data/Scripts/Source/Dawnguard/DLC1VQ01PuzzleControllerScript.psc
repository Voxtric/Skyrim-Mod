Scriptname DLC1VQ01PuzzleControllerScript extends ObjectReference  


import debug
import utility

quest property DLC1VQ01 auto


;Actor Property PuzzleBoss01 auto
;Actor Property PuzzleBoss02 auto
;Actor Property PuzzleBoss03 auto
;ObjectReference property PuzzleBossLinker auto

objectReference property PuzzleBase auto 
objectReference property CoffinActivator auto
objectReference property buttonFurniture auto
objectReference property gate auto
;objectReference property collisionEnableMarker auto  
objectReference property SeranaRef auto 

;these are for each of the Brazier activators
objectReference property brazier01 auto 
objectReference property brazier02 auto 
objectReference property brazier03 auto 
objectReference property brazier04 auto 
objectReference property brazier05 auto 

DLC1VQ01PuzzleBrazierScript Brazier01Script 
DLC1VQ01PuzzleBrazierScript Brazier02Script 
DLC1VQ01PuzzleBrazierScript Brazier03Script
DLC1VQ01PuzzleBrazierScript Brazier04Script
DLC1VQ01PuzzleBrazierScript Brazier05Script

;idle property handCut auto

message property combatMessage auto

int property lightPoint = 1 auto Hidden

sound property QSTSeranaTombMagicAmbience2D auto

Event OnCellAttach()
;set Brazier activator scripts
		Actor Serana = SeranaRef as Actor
		Brazier01Script = brazier01 as DLC1VQ01PuzzleBrazierScript
		Brazier02Script = Brazier02 as DLC1VQ01PuzzleBrazierScript
		Brazier03Script = Brazier03 as DLC1VQ01PuzzleBrazierScript
		Brazier04Script = Brazier04 as DLC1VQ01PuzzleBrazierScript
		Brazier05Script = Brazier05 as DLC1VQ01PuzzleBrazierScript
		Serana.setGhost(true)
EndEvent

auto State Start
	Event onActivate(objectReference triggerRef)
		;when the player first activates the bowl, play blood animation on the Braziers and the base, move to puzzle state
		if game.getplayer().IsinCombat() == 0
			gotoState("Solution")
			wait(3)
			puzzleBase.Activate(PuzzleBase)
			puzzleBase.playAnimation("Line01")
			QSTSeranaTombMagicAmbience2D.play(puzzleBase)
		elseif game.getplayer().IsinCombat() == 1
			;combatMessage.show()
			;do nothing
		endif
	endEvent
endState

State Solution
	Event onActivate(objectReference triggerRef)
		if LightPoint == 1 && Brazier01Script.solved == 1 
		;brazier 1 is in place
			debug.trace("addingLine2")
			lightPoint = 2
			puzzleBase.playAnimation("Line02")
		elseif LightPoint == 2 && Brazier01Script.solved == 0
		;brazier 1 has been moved out of place.
			debug.trace("removingLine2")
			lightPoint = 1
			puzzleBase.playAnimation("Line01")
		endif
		if LightPoint == 2 && Brazier01Script.solved == 1 && Brazier02Script.solved == 1 
		; brazier 1 and 2 are in place. Locks Brazier 1.
			debug.trace("addingLine3")
			puzzleBase.playAnimation("Line03")
			lightPoint = 3
			Brazier01Script.Locked = 1
		elseif lightPoint == 3 && Brazier01Script.solved == 1 && Brazier02Script.solved == 0
		;brazier 2 has been moved out of place. Unlocks Brazier 1.
			debug.trace("removingLine3")
			lightPoint = 2
			puzzleBase.playAnimation("Line02")
			Brazier01Script.Locked = 0
		endif
		if LightPoint == 3 && Brazier01Script.solved == 1 && Brazier02Script.solved == 1 && Brazier03Script.solved == 1 
		;brazier 1,2,and 3 are in place. Locks Brazier 2.
			debug.trace("addingLine4")
			lightPoint = 4
			puzzleBase.playAnimation("Line04")
			Brazier02Script.Locked = 1
		elseif lightPoint == 4 && Brazier01Script.solved == 1 && Brazier02Script.solved == 1 && Brazier03Script.solved == 0
		;Brazier 3 has been moved out of place. Unlocks Brazier 2.
			debug.trace("removingLine4")
			lightPoint = 3
			puzzleBase.playAnimation("Line03")
			Brazier02Script.Locked = 0
		endif
		if LightPoint == 4 && Brazier01Script.solved == 1 && Brazier02Script.solved == 1 && Brazier03Script.solved == 1 && Brazier04Script.solved == 1 
		;brazier 1,2,3, and 4 are in place. Locks Brazier 3.
			debug.trace("addingLine5")
			puzzleBase.playAnimation("Line05")
			lightPoint = 5
			Brazier03Script.Locked = 1
		elseif lightPoint == 5 && Brazier01Script.solved == 1 && Brazier02Script.solved == 1 && Brazier03Script.solved == 1 && Brazier04Script.solved == 0
		;Brazier 4 has been moved out of place. Unlocks Brazier 3.
			debug.trace("removingLine5")
			puzzleBase.playAnimation("Line04")
			lightPoint = 4
			Brazier03Script.Locked = 0
		endif
		if LightPoint == 5 && Brazier01Script.solved == 1 && Brazier02Script.solved == 1 && Brazier03Script.solved == 1 && Brazier04Script.solved == 1 && Brazier05Script.solved == 1
		;Each Brazier is in the correct state, causes the puzzle to open, goes to done state.
			gotoState("done")
			Brazier04Script.Locked = 1
			puzzleBase.playAnimationAndWait("Line06", "done")
			;PuzzleBossLinker.Activate(PuzzleBossLinker)
			Brazier01Script.gotoState("done")
			Brazier02Script.gotoState("done")
			Brazier03Script.gotoState("done")
			Brazier04Script.gotoState("done")
			Brazier05Script.gotoState("done")	
			;while PuzzleBoss01.IsDead() == 0 && PuzzleBoss02.IsDead() == 0 && PuzzleBoss03.IsDead() == 0 
			;	utility.wait(1)
			;endWhile
			puzzleBase.RampRumble(1, 4, 1500)
			puzzleBase.playAnimationandWait("open", "done")
			coffinActivator.enable()
			gate.setOpen(false)
			self.disable()
		;elseif lightPoint == 5 && Brazier01Script.solved == 1 && Brazier02Script.solved == 1 && Brazier03Script.solved == 1 && Brazier04Script.solved == 1 && Brazier05Script.solved == 0
		;	puzzleBase.playAnimation("Line05")
		;	lightPoint = 4
		endif	
	endEvent
EndState

State done
;do nothing
EndState
