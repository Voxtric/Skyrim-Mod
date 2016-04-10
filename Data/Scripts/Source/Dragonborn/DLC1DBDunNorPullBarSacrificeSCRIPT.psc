Scriptname DLC1DBDunNorPullBarSacrificeSCRIPT extends ObjectReference Hidden 

import utility
import debug

	; Contains link to the shaft trapdoor
Keyword Property LinkCustom01 auto

auto STATE WaitingForActivate
	Event OnActivate(ObjectReference akActionRef)

		GoToState("Busy")

		if akActionRef == Game.GetPlayer()
			GetLinkedRef(LinkCustom01).Activate(self)
			Wait(1.25)
			GetLinkedRef(LinkCustom01).Activate(self)
			Wait(1)
			GoToState("WaitingForActivate")
		else
			GoToState("WaitingForActivate")
		endif

	EndEvent

EndSTATE


STATE Busy
	; Do Nothing
EndSTATE