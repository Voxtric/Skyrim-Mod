Scriptname DLC2QALearnShouts extends ObjectReference  
;Steps through a FormList (WordList) of Words of Power, teaches them to the player, and unlocks them for use

;List of Words of Power to teach the player
FormList Property WordList  Auto  

;Index of the next NPC to spawn
Int currentIndex = 0

;Size of the form list
Int formSize


event onCellAttach()
	;Keep button closed if the form list is empty
	formSize = WordList.GetSize()
	if formSize == 0
		playAnimation("Close")
	else
		playAnimation("Open")
	endIf
endEvent


auto state open
	event onActivate(objectReference akActivator)
		goToState("waiting")
		playAnimationAndWait("Trigger01","done")

		;Teach and Unlock the words of power when the player activates the button
		if (akActivator == Game.getplayer())
			;Close the button to prevent the player from spamming it
			playAnimation("Close")
			while (currentIndex < formSize)
				game.teachword((WordList.getAt(currentIndex) as WordOfPower))
				game.unlockword((WordList.getAt(currentIndex) as WordOfPower))
				currentIndex += 1
			endWhile
			goToState("Close")
		endIf
	endEvent
endState

state waiting
endState