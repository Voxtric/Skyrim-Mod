Scriptname DLC2TTR7PlayerScript extends ReferenceAlias  

ReferenceAlias Property Staff  Auto  
Quest Property DLC2TTR7  Auto  

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akItemReference == staff.GetRef()
		DLC2TTR7.SetStage(200)
	endIf
EndEvent
