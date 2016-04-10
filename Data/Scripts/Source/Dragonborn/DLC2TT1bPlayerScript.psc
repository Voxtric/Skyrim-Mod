Scriptname DLC2TT1bPlayerScript extends ReferenceAlias

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akBaseItem == DLC2TT1bMogrulNote
		DLC2TT1b.SetStage(100)
	endif
EndEvent

Book Property DLC2TT1bMogrulNote  Auto  

Quest Property DLC2TT1b  Auto  
