Scriptname DLC1RV05RemainsScript extends ReferenceAlias  
{Script on Remains alias in DLC1RV05 quest}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if (akNewContainer == Game.GetPlayer())
		Debug.Trace(self + "OnContainerChanged() to player")
		GetOwningQuest().SetStage(100)
	endif
EndEvent