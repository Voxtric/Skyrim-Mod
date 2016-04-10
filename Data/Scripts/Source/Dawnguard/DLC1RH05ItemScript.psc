Scriptname DLC1RH05ItemScript extends ReferenceAlias  
{Script attached to Item alias in DLC1RH05}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		Debug.Trace(self + "OnContainerChanged() player taking item, setting stage 100")
		GetOwningQuest().SetStage(100)
	endif
EndEvent