Scriptname DLC1dunPitcherPuzzleScript extends ObjectReference

import game
import utility
import debug

miscObject property pitcher auto
objectReference property myDust auto
message property myMessage auto

bool bInserted = false
objectReference myLink

;************************************

auto State waiting
	Event OnActivate(ObjectReference akActionRef)
		if(akActionRef == game.GetPlayer())
			gotoState("busy")
			myLink = getLinkedRef()
			;check to see if player has the pitcher
			if(!bInserted)
				if(game.getPlayer().getItemCount(pitcher) >= 1)
					game.getPlayer().removeItem(pitcher)
					playAnimationAndWait("Place", "done")
					bInserted = true
					myDust.activate(self)
					ShakeCamera(self, 0.3, 2)
					ShakeController(0.7, 0.7, 2)
					myLink.playAnimationAndWait("Open", "done")
				else
					myMessage.show()
					;player does not have the pitcher, show message
				endif
			else
				game.getPlayer().addItem(pitcher)
				playAnimationAndWait("Take", "done")
				bInserted = false
				myDust.activate(self)
				ShakeCamera(self, 0.3, 2)
				ShakeController(0.7, 0.7, 2)
				myLink.playAnimationAndWait("Close", "done")
			endif
			gotoState("waiting")
		endif
	endEvent
endState

;************************************

State busy
	Event onActivate(ObjectReference akActionRef)
		;busy animating

	endEvent
endState
;************************************