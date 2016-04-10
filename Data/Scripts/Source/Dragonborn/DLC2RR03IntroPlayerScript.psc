Scriptname DLC2RR03IntroPlayerScript  extends ReferenceAlias Conditional

Quest Property pDLC2RR03Intro Auto
Weapon Property pDLC2RR03NordPickaxe Auto

Event OnInit()

	AddInventoryEventFilter(pDLC2RR03NordPickaxe)

endEvent

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)

	if akBaseItem == pDLC2RR03NordPickaxe
		if pDLC2RR03Intro.GetStageDone(20) == 0
			pDLC2RR03Intro.SetStage(20)
		endif
	endif

endEvent
