Scriptname DLC1VQ01PuzzleMouthScript extends ObjectReference  
;Script that goes on each of the mouth pieces for the puzzle
;Controls the animation and sends an activate event to the controller when in the correct position
import debug
message property wontBudge auto
;message to show before puzzle is activated
objectReference property puzzleController auto
;where th emain script lives
bool property solved = false auto hidden
;Variable determines if the mouth is in the correct state, 1 means the correct state. Starts false
int property solvedState auto
;Property that allows user to select which of the three states is the correct state for this particular piece
;1= Top, 2= Mid, 3 = Bot

DLC1VQ01PuzzleControllerScript mainScript

Event OnCellAttach()
	mainScript = puzzleController as DLC1VQ01PuzzleControllerScript
	if solvedState == 1
	;if top is the correct state, start with solved being true
		solved = 1
	endif
endEvent 


auto state Top
	Event onActivate(objectReference triggerRef)
		if mainScript.Getstate() == "Solution"
			solved = 0
			self.PlayAnimation( "bot")
			goToState("Bot")
			if solvedState == 3
				solved = 1
				puzzleController.Activate(puzzleController)
			endif
		else
			wontBudge.show()
		endif
	EndEvent
endState


state Bot
	Event OnActivate(objectReference triggerRef)
		solved = 0
		self.PlayAnimation("mid")
		goToState("Mid")
		if solvedState == 2
			solved = 1
			puzzleController.Activate(puzzleController)
		endif
	EndEvent
endState

state Mid
	Event OnActivate(objectReference triggerRef)
		solved = 0
		self.PlayAnimation("top")
		goToState("top")
		if solvedState == 1
			solved = 1
			puzzleController.Activate(puzzleController)
		endif
	EndEvent
endState

state Done
	Event OnActivate(objectReference triggerRef)
		wontBudge.show()
	EndEvent
endState