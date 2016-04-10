Scriptname DLC2BlackBookScript extends ObjectReference  Conditional
{script for books that send you to Apocrypha}

GlobalVariable Property DLC2BooksActive auto
Keyword Property DLC2LinkBlackBookEnabled auto

Bool Property ReenableControls=True Auto Conditional
{ reenable controls after reading if true; otherwise don't }

Bool Property DisableLooking=false Auto Conditional
{ when locking controls, should we disable the camera? default = FALSE }

bool Property bPlayerHasRead = false Auto Conditional Hidden
{ set to true after player has read it once - when false, ignore "can read" restrictions }

Event OnRead()
;  	debug.trace(self + "OnRead ")
 	if (DLC2BooksActive.GetValueInt() == 1) ; for Shane's debugging during layout
 		; pass along myReference rather than self - ReadBook always wants the book's real reference
;  		debug.trace(self + " reading - pass along myReference=" + myReference)
		GetLinkedRef(DLC2LinkBlackBookEnabled).Disable()
		DLC2BookDungeonController.ReadBook(myReference as DLC2BlackBookScript, self)
	endif
endEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	; when enters player's inventory, swap aliases so that it has full name again
	if akNewContainer == Game.GetPlayer()
; 		debug.trace(self + " OnContainerChanged")
		DLC2BookDungeonController.TakeBook(myReference as DLC2BlackBookScript)
	endif
endEvent

function SetDungeonMarker(ObjectReference newMarker)
; 	debug.trace(self + " resetting DungeonMarker to " + newMarker)
	DungeonMarker = newMarker
; 	debug.trace(self + " DungeonMarker=" + DungeonMarker)
endFunction

DLC2BookDungeonControllerScript Property DLC2BookDungeonController  Auto  

ObjectReference Property DungeonMarker Auto
{ marker to send player to }

Location Property DungeonLocation Auto
{ dungeon location - REQUIRED - dungeon needs to be all in a single location }

Quest Property myQuest  Auto  
{(optional) quest to set stage on when read}

Int Property myQuestStage  Auto  
{optional quest stage to set when read}

ObjectReference Property myReference  Auto  
{points to reference of this book - necessary because 
most reference data becomes inaccessible from an inventory object
}
