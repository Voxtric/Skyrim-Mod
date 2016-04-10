Scriptname DLC2Book01PuzzleQuestScript extends Quest  

ReferenceAlias Property BookContainer auto
ReferenceAlias Property BookTentacles auto
ReferenceAlias Property BookClaws auto
ReferenceAlias Property BookTeeth auto
ReferenceAlias Property BookEyes auto

Function GiveBookToPlayer(int BookNumber)
	if BookNumber == 1
		game.GetPlayer().AddItem(BookTentacles.getRef())
	elseif BookNumber == 2
		game.GetPlayer().AddItem(BookClaws.getRef())
	elseif BookNumber == 3
		game.GetPlayer().AddItem(BookTeeth.getRef())
	elseif BookNumber == 4
		game.GetPlayer().AddItem(BookEyes.getRef())
	endif
endFunction

;RemoveItem(Form akItemToRemove, int aiCount = 1, bool abSilent = false, ObjectReference akOtherContainer = None)
Function TakeBookFromPlayer(int BookNumber)
	if BookNumber == 1
		game.GetPlayer().RemoveItem(BookTentacles.getRef(), 1, false, BookContainer.getRef())
	elseif BookNumber == 2
		game.GetPlayer().RemoveItem(BookClaws.getRef(), 1, false, BookContainer.getRef())
	elseif BookNumber == 3
		game.GetPlayer().RemoveItem(BookTeeth.getRef(), 1, false, BookContainer.getRef())
	elseif BookNumber == 4
		game.GetPlayer().RemoveItem(BookEyes.getRef(), 1, false, BookContainer.getRef())
	endif
endFunction