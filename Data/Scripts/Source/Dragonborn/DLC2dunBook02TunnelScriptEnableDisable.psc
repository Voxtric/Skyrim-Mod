Scriptname DLC2dunBook02TunnelScriptEnableDisable extends ObjectReference  
{handles the enabling and disabling of tunnel papers in Book02 dungeon}

import utility
import debug

ObjectReference property myPapers01 auto
ObjectReference property myPapers02 auto
ObjectReference property myMover auto

float property myTimer01 auto
float property myTimer02 auto

;******************************************************

auto State Waiting
	Event OnActivate (objectReference triggerRef)
		GoToState("done")
		wait(myTimer01)
		myPapers01.enable(true)
		wait(myTimer02)
		myPapers02.disable()
		myMover.activate(myMover)
	endEvent
endState

;******************************************************

State done
	;do nothing
endState

;******************************************************