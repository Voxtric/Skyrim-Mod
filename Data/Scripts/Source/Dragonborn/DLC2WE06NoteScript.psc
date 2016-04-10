Scriptname DLC2WE06NoteScript extends ReferenceAlias 
{Script attached to Note alias in DLC2WE06 quest}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
; 	Debug.Trace(self + "OnContainerChanged() akNewContainer = " + akNewContainer)
	if akNewContainer == Game.GetPlayer()
		GetOwningQuest().SetStage(20)
	endif
EndEvent

Event OnRead()
; 	Debug.Trace(self + "OnRead()")
	GetOwningQuest().setStage(50)
	
EndEvent