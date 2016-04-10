Scriptname DLC2WB01JournalScript extends ReferenceAlias  



Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer != Game.GetPlayer())
		return
	endif
; 	Debug.Trace("DLC2WB: Got journal")
	if ( (GetOwningQuest().GetStage() >= 10) && (GetOwningQuest().GetStage() < 20) )
		GetOwningQuest().SetStage(20)
	endif
EndEvent
