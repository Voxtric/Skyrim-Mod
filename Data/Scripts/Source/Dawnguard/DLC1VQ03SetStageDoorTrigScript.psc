scriptname DLC1VQ03SetStageDoorTrigScript extends objectReference
{ this is a generic script for one-shot quest stage updates}

import game
import debug

quest property myQuest auto	
{ quest to call SetStage on}

quest property dlc1vq03hunter auto
quest property dlc1vq03vampire auto

int property stage = 60 auto
{ stage to set}

bool property doOnce = True auto
{Set the stage only once.}

int property prereqStageOPT = -1 auto
{ OPTIONAL: stage that must be set for this trigger to fire }

bool property disableWhenDone = true auto
{ disable myself after I've been triggered. Defaults to true }


auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == getPlayer() as actor
			if dlc1vq03hunter.isRunning()
				MyQuest = dlc1vq03hunter
			elseif dlc1vq03vampire.isRunning()
				MyQuest = dlc1vq03vampire
			endif
			
			if MyQuest
				; check to see if a pre-req stage was specificed and if it's been met
				if MyQuest.getStageDone(stage) == 0
					
					; do the actual business of setting the stage we want
					myQuest.setStage(stage)
					if doOnce
						gotoState("hasBeenTriggered")
					endif
					if disableWhenDone
						Disable()
					endif
				endif
			endif
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE
