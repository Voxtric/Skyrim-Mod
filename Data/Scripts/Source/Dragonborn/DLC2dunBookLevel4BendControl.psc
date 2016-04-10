Scriptname DLC2dunBookLevel4BendControl extends ObjectReference
{toggle middle, left, right}

import Utility
import Debug

bool Bending = false

;******************************************************

Function bend(int myBend)
	;0 = continue bending
	;1 = bend right
	;2 = bend left
	;3 = reset to middle
	if(myBend == 0)
		playAnimationAndWait("Left", "done")
		Bending = true
		goToState("ContinueBending")
	elseif(myBend == 1)
		playAnimationAndWait("Right", "done")
	elseif(myBend == 2)
		playAnimationAndWait("Left", "done")
	elseif(myBend == 3)
		playAnimationAndWait("Reset", "done")
	endif

endFunction

;******************************************************

State ContinueBending
	Event OnBeginState()
	
		while(Bending)
			playAnimationAndWait("Left", "doneLeft")
			;playAnimationAndWait("Return", "done")
			playAnimationAndWait("Right", "doneRight")
		endWhile

	endEvent
endState


;******************************************************
