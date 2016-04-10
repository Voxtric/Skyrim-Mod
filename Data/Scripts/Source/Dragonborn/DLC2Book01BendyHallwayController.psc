Scriptname DLC2Book01BendyHallwayController extends ObjectReference
{Middle, Right, Left}

import Utility
import Debug

bool initialized = false
bool property Bending = false auto hidden
int property startingPosition = 0 auto
{;0 = Middle
	;1 = Right
	;2 = Left}
int property currentPosition auto hidden
int property previousPosition auto hidden

;******************************************************

	Function bend(int myBend)
		;0 = bend middle
		;1 = bend right
		;2 = bend left
		;3 = revert to starting position
		;4 = return to previous position
		while bending ;&& is3dAttached()
			utility.wait(0.3)
		endWhile
		if myBend != 4
			previousPosition = currentPosition
		endif
		bending = true
		if(myBend == 0)
			playAnimationAndWait("Reset", "done")
			currentPosition = 0
		elseif(myBend == 1)
			playAnimationAndWait("Right", "doneRight")
			currentPosition = 1
		elseif(myBend == 2)
			playAnimationAndWait("Left", "doneLeft")
			currentPosition = 2		
		elseif(myBend == 3)
			ReturnToStartingPosition()
		elseif(myBend == 4)
			ReturnToLastPosition()
		endif
		bending = false
	endFunction

;******************************************************

event onCellAttach()
	if !initialized
		GoToStartingPosition()
		initialized = true
	endif
endEvent


;******************************************************

Function GoToStartingPosition()
	if(startingPosition == 0);Default so do nothing
		;playAnimationAndWait("Reset", "done")
	elseif(startingPosition == 1)
		playAnimation("StartRight")
		currentPosition = 1
	elseif(startingPosition == 2)
		playAnimation("StartLeft")	
		currentPosition = 2	
	endif
	previousPosition = currentPosition
endFunction

Function ReturnToStartingPosition()
	if(startingPosition == 0)
		playAnimationAndWait("Reset", "done")
		currentPosition = 0
	elseif(startingPosition == 1)
		playAnimationAndWait("Right", "doneRight")
		currentPosition = 1
	elseif(startingPosition == 2)
		playAnimationAndWait("Left", "doneLeft")	
		currentPosition = 2	
	endif
endFunction

Function ReturnToLastPosition()
	int storedPreviousPosition = currentPosition
	if(previousPosition == 0)
		playAnimationAndWait("Reset", "done")
		currentPosition = 0
	elseif(previousPosition == 1)
		playAnimationAndWait("Right", "doneRight")
		currentPosition = 1
	elseif(previousPosition == 2)
		playAnimationAndWait("Left", "doneLeft")	
		currentPosition = 2	
	endif
	previousPosition = storedPreviousPosition
endFunction