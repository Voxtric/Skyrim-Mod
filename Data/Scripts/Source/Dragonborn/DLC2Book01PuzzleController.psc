Scriptname DLC2Book01PuzzleController extends ObjectReference

bool property book1Placed = false auto hidden
bool property book2Placed = false auto hidden
bool property book3Placed = false auto hidden
bool property book4Placed = false auto hidden

ObjectReference property DLC2Book01PuzzleActivatorRef001 auto
ObjectReference property DLC2Book01PuzzleActivatorRef002 auto
ObjectReference property DLC2Book01PuzzleActivatorRef003 auto
ObjectReference property DLC2Book01PuzzleActivatorRef004 auto
ObjectReference property DLC2Book01IntToEnd auto
DLC2Book01PuzzleActivator Property Book1 auto hidden
DLC2Book01PuzzleActivator Property Book2 auto hidden
DLC2Book01PuzzleActivator Property Book3 auto hidden
DLC2Book01PuzzleActivator Property Book4 auto hidden
ObjectReference Property DLC2MQPuzzleStandTentaclesRef auto
ObjectReference Property DLC2MQPuzzleStandClawsRef auto
ObjectReference Property DLC2MQPuzzleStandTeethRef auto
ObjectReference Property DLC2MQPuzzleStandEyesRef auto
ObjectReference Property DLC2MQ06PuzzleStatueRef auto
bool property booksRegistered = false auto hidden

visualEffect property trailFX auto
visualEffect property trailFX02 auto
float property fDelay = 10.0 auto hidden

Quest Property DLC2Book01PuzzleQST auto

Auto State Waiting
endState

State Done
	Event OnBeginState()
		Book1.GoToState("Complete")
		Book2.GoToState("Complete")
		Book3.GoToState("Complete")
		Book4.GoToState("Complete")
		TrailFX02.play(DLC2MQPuzzleStandTentaclesRef,fDelay,DLC2MQ06PuzzleStatueRef)
		TrailFX02.play(DLC2MQPuzzleStandClawsRef,fDelay,DLC2MQ06PuzzleStatueRef)
		TrailFX02.play(DLC2MQPuzzleStandTeethRef,fDelay,DLC2MQ06PuzzleStatueRef)
		TrailFX02.play(DLC2MQPuzzleStandEyesRef,fDelay,DLC2MQ06PuzzleStatueRef)
		TrailFX.play(DLC2MQ06PuzzleStatueRef,fDelay,DLC2MQPuzzleStandTentaclesRef)
		TrailFX.play(DLC2MQ06PuzzleStatueRef,fDelay,DLC2MQPuzzleStandClawsRef)
		TrailFX.play(DLC2MQ06PuzzleStatueRef,fDelay,DLC2MQPuzzleStandTeethRef)
		TrailFX.play(DLC2MQ06PuzzleStatueRef,fDelay,DLC2MQPuzzleStandEyesRef)
		DLC2Book01IntToEnd.Enable(abFadeIn = True)
	endEvent

	Function BookPlaced(int BookNumber)
	EndFunction

	Function BookRemoved(int BookNumber)
	endFunction
EndState

Function BookPlaced(int BookNumber)
	if !booksRegistered
		RegisterBooks()
	endif
	if bookNumber == 1
		book1Placed = True
	elseif bookNumber == 2
		book2Placed = True
	elseif bookNumber == 3
		book3Placed = True
	elseif bookNumber == 4
		book4Placed = True
	endif
	CheckForPuzzleCompletion()
EndFunction

Function BookRemoved(int BookNumber)
	if bookNumber == 1
		book1Placed = False
	elseif bookNumber == 2
		book2Placed = False
	elseif bookNumber == 3
		book3Placed = False
	elseif bookNumber == 4
		book4Placed = False
	endif
endFunction

Function CheckForPuzzleCompletion()
	if book1Placed && book2Placed && book3Placed && book4Placed
		goToState("Done")
	endif
EndFunction

Function RegisterBooks()
	Book1 = DLC2Book01PuzzleActivatorRef001 as DLC2Book01PuzzleActivator
	Book2 = DLC2Book01PuzzleActivatorRef002 as DLC2Book01PuzzleActivator
	Book3 = DLC2Book01PuzzleActivatorRef003 as DLC2Book01PuzzleActivator
	Book4 = DLC2Book01PuzzleActivatorRef004 as DLC2Book01PuzzleActivator
	booksRegistered = True
endFunction