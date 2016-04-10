Scriptname DLC2TTR1PlayerScript extends ReferenceAlias  

ReferenceAlias Property ApocryphaBook  Auto  
Quest Property DLC2TTR1  Auto  

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	If akItemReference == ApocryphaBook.GetRef()
		DLC2TTR1.SetStage(200)
	endIF
EndEvent

