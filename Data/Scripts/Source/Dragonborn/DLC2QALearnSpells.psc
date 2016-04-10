Scriptname DLC2QALearnSpells extends ObjectReference  
;Steps through a FormList (SpellList) of spells and teaches them to the player.

;List of NPCs that the player can spawn
FormList Property SpellList  Auto  

;Index of the next NPC to spawn
Int currentIndex = 0

;Size of the form list
Int formSize

event onCellAttach()
	;Keep button closed if the form list is empty
	formSize = SpellList.GetSize()
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

		;Reset the current index once it reaches the last object
		if (akActivator == Game.getplayer())
			;Close the button to prevent the player from spamming it
			playAnimation("Close")
			while (currentIndex < formSize)
				game.getplayer().addspell((SpellList.getAt(currentIndex) as Spell))
				currentIndex += 1
			endWhile
			goToState("Close")
		endIf
	endEvent
endState

state waiting
endState