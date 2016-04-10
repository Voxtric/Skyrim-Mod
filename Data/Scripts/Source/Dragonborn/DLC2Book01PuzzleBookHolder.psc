ScriptName DLC2Book01PuzzleBookHolder Extends ObjectReference


Quest Property DLC2Book01PuzzleQST auto
DLC2Book01PuzzleQuestScript Property QuestScript auto hidden
int Property BookNumber = 1 auto

GlobalVariable Property DLC2Book01TakenBookInPartA auto
bool Property IsLastBook = False auto

auto State Waiting
	event onActivate(ObjectReference akActivator)
		if akActivator == game.GetPlayer()
			GoToState("Done")
			;Declare the quest script and tell the quest to give the player the book
			QuestScript = DLC2Book01PuzzleQST as DLC2Book01PuzzleQuestScript
			QuestScript.GiveBookToPlayer(BookNumber)
			if IsLastBook
				DLC2Book01TakenBookInPartA.SetValue(1)
			endIf
			;Manage any thing linked to this
			if (getLinkedRef() as default2stateActivator) || (getLinkedRef().getBaseObject() as door)
				getLinkedRef().setOpen(True)
				objectReference currentLink = getLinkedRef()
				while (CurrentLink.getLinkedRef() as default2stateActivator) || (CurrentLink.getLinkedRef().getBaseObject() as door)
					CurrentLink.getLinkedRef().setOpen(True)
					CurrentLink = currentLink.getLinkedRef()
				endwhile
			endif
			self.activate(self)
		endif
	endEvent
endState


state Done
	event onBeginState()
		self.Disable()
	endEvent
EndState
