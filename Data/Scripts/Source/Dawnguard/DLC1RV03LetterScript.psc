Scriptname DLC1RV03LetterScript extends ReferenceAlias 
{Script attached to Letter alias in DLC1RV03 quest}

ReferenceAlias Property Victim auto

GlobalVariable Property DLC1RV03LetterIn auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	Debug.Trace(self + "OnContainerChanged() akNewContainer:" + akNewContainer + ", akOldContainer:" + akOldContainer)
	Quest myQuest = GetOwningQuest()

	if myQuest.GetStageDone(200)

		if (akNewContainer == Victim.GetReference())
			DLC1RV03LetterIn.setValue(1)
			myQuest.setObjectiveCompleted(200)
			myQuest.setObjectiveDisplayed(220, true, true)
		else
			DLC1RV03LetterIn.setValue(0)
			myQuest.setObjectiveCompleted(200, false)
			myQuest.setObjectiveDisplayed(200, true, true)
			myQuest.setObjectiveDisplayed(220, false)

		endif

	endif
EndEvent

