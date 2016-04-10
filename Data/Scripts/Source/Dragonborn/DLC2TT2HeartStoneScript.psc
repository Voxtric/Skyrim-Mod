Scriptname DLC2TT2HeartStoneScript extends ReferenceAlias  

Quest Property DLC2TT2  Auto  


Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == Game.GetPlayer()
		DLC2TT2.SetStage(200)
	endIf
EndEvent
