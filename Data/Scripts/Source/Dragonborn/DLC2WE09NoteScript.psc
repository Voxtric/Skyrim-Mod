Scriptname DLC2WE09NoteScript extends ReferenceAlias  

Quest property DLC2MQ01 auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		Quest myQuest = GetOwningQuest()
		if myQuest.IsObjectiveDisplayed(10) && myQuest.IsObjectiveCompleted(10) == false
			myQuest.setObjectiveCompleted(10)
		endif
	endif

endevent

Event OnRead()
	;sets the initial DLC2 MQ objective
	DLC2MQ01.setStage(10)

endevent