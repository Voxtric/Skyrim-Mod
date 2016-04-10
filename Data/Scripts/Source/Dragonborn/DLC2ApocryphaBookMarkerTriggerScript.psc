Scriptname DLC2ApocryphaBookMarkerTriggerScript extends ObjectReference  
{moves the dungeon marker for the associated book to the specified marker when the player enters}

ObjectReference Property myMarker  Auto  
{new marker - where to move the player when he reads the associated book in Solstheim}

DLC2BlackBookScript Property myBook  Auto  
{associated black book (original ref in Solstheim)}

import game

auto STATE waitingForPlayer
	EVENT onTriggerEnter(objectReference triggerRef)
		if triggerRef == getPlayer() as actor
			myBook.DungeonMarker = myMarker
			gotoState("hasBeenTriggered")
			Disable()
		endif
	endEVENT
endSTATE

STATE hasBeenTriggered
	; this is an empty state.
endSTATE

