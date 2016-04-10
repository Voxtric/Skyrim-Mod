scriptName DLC2WordWallTriggerBendWillScript extends ObjectReference
{
- This script keeps track of the player entering and leaving trigger.
}

import debug
import utility

DLC2WordWallTriggerScript mySelf

;************************************

Event onLoad()
	mySelf = (self as ObjectReference) as DLC2WordWallTriggerScript
endEvent

;************************************

auto State Listening
	Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if(actorRef == game.getPlayer())
			;player has entered the trigger
			;if player hasn't learned the word, enable the next word in the shout
			if(mySelf.WordLearned == false)
				if(mySelf.shoutGlobal.value == 0)
					mySelf.lookTarget = mySelf.lookTargetWord01
					mySelf.myWord = mySelf.myWord01
					mySelf.wordSound = mySelf.word01Sound
					mySelf.wordWall = mySelf.wordWall01
				endif
				mySelf.StartWordWall()
			else
				;player has learned the word, don't need to listen anymore
				gotoState("done")
			endif
		endif
	endEvent
	
	Event onTriggerLeave(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		if (actorRef == game.GetPlayer())
			;player has left the trigger
			if(mySelf.WordLearned)
				;player has learned the word, don't need to listen anymore
				gotoState("done")
				self.disable()
			else
				;player hasn't learned the word, so set everything back up
				mySelf.wordWall01.enableNoWait()
				mySelf.word01Sound.enableNoWait()
			endif
			mySelf.StopWordWall()
		endif
	endEvent
endState

;************************************

State done
	;do nothing
endState

;************************************
