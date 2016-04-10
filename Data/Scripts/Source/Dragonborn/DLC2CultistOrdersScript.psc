Scriptname DLC2CultistOrdersScript extends ObjectReference  

Quest property DLC2MQ01 auto

ReferenceAlias Property DLC2CultistOrdersQuestObjectHandlerNote auto

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	;sets the initial DLC2 MQ objective
	if akNewContainer == Game.GetPlayer() && DLC2MQ01.GetStage() < 7
; 		Debug.Trace(self + "OnContainerChanged() player took note")
		DLC2CultistOrdersQuestObjectHandlerNote.ForceRefTo(self)
		DLC2MQ01.setStage(7)
	endif
	

endevent

Event OnRead()
	;sets the initial DLC2 MQ objective
; 	Debug.Trace(self + "OnRead() player read note")
	DLC2CultistOrdersQuestObjectHandlerNote.Clear()
	DLC2MQ01.setStage(10)

endevent