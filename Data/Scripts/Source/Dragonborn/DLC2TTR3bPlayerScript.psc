Scriptname DLC2TTR3bPlayerScript extends ReferenceAlias  

ReferenceAlias Property WindAndSand  Auto  

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akItemReference == WindAndSand.GetRef()
		DLC2TTR3b.SetStage(200)
	endif
EndEvent

Quest Property DLC2TTR3b  Auto  
