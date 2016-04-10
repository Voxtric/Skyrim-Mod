ScriptName DLC2Book01PuzzleActivator Extends ObjectReference


ObjectReference Property DLC2Book01PuzzleControllerRef auto
DLC2Book01PuzzleController Property myController auto hidden
Message Property DLC2Book01PuzzleActivatorEmptyMessage auto
Message Property DLC2Book01PuzzleActivatorBook1Message auto
Message Property DLC2Book01PuzzleActivatorBook2Message auto
Message Property DLC2Book01PuzzleActivatorBook3Message auto
Message Property DLC2Book01PuzzleActivatorBook4Message auto
int Property CorrectBookNumber auto
int Property BookNumberPlaced = 0 auto hidden
Book Property DLC2MQ06PuzzleBook01 auto
Book Property DLC2MQ06PuzzleBook02 auto
Book Property DLC2MQ06PuzzleBook03 auto
Book Property DLC2MQ06PuzzleBook04 auto
Quest Property DLC2Book01PuzzleQST auto
DLC2Book01PuzzleQuestScript Property QuestScript auto hidden

auto State Waiting
	Event OnActivate(ObjectReference akActivator)
		int removeBook
		if QuestScript == NONE
			QuestScript = DLC2Book01PuzzleQST as DLC2Book01PuzzleQuestScript
		endif
		if akActivator == game.GetPlayer()
			GotoState("Busy")
			;pick which message to show
			if BookNumberPlaced == 0
				BookNumberPlaced = DLC2Book01PuzzleActivatorEmptyMessage.Show()
			elseif BookNumberPlaced == 1
				removeBook = DLC2Book01PuzzleActivatorBook1Message.Show()
				if removeBook == 1
								;removeBook1
					QuestScript.GiveBookToPlayer(BookNumberPlaced)
					BookNumberPlaced = 0
				endif			;Otherwise do Nothing
			elseif BookNumberPlaced == 2
				removeBook = DLC2Book01PuzzleActivatorBook2Message.Show()
				if removeBook == 1
								;removeBook2
					QuestScript.GiveBookToPlayer(BookNumberPlaced)
					BookNumberPlaced = 0
				endif
			elseif BookNumberPlaced == 3
				removeBook = DLC2Book01PuzzleActivatorBook3Message.Show()
				if removeBook == 1
								;removeBook3
					QuestScript.GiveBookToPlayer(BookNumberPlaced)
					BookNumberPlaced = 0
				endif
			elseif BookNumberPlaced == 4
				removeBook = DLC2Book01PuzzleActivatorBook4Message.Show()
				if removeBook == 1
								;removeBook4
					QuestScript.GiveBookToPlayer(BookNumberPlaced)
					BookNumberPlaced = 0
				endif
			endif
			if BookNumberPlaced != 0
				getLinkedRef().Enable()
				QuestScript.TakeBookFromPlayer(BookNumberPlaced)
			endif
			;Talk to the Controller
			if BookNumberPlaced == CorrectBookNumber
				myController.BookPlaced(CorrectBookNumber)
			elseif BookNumberPlaced == 0
				myController.BookRemoved(CorrectBookNumber)
				getLinkedRef().Disable()
			endif

			;go back to waiting
			GotoState("Waiting")
		endif
	EndEvent
endState


State Busy
endState


State Complete
	event OnBeginState()
		self.SetDestroyed(True)
	endEvent
endState

Event OnLoad()
	myController = DLC2Book01PuzzleControllerRef as DLC2Book01PuzzleController
endEvent