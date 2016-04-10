Scriptname DLC2dunBook3SeekerScript extends Actor  
import Debug
import Utility

Keyword Property LinkCustom01 auto 

ObjectReference SeekerGate

Bool isCounted = FALSE

;Event OnCellLoad()
;	SeekerGate = GetLinkedRef(LinkCustom01)
;	if (isCounted == FALSE)
;		isCounted = TRUE
;		(SeekerGate as DLC2ApoBook3SeekerDoorScript).GetSeekerNumber()
;	endif
;endEvent

Event OnCellAttach()
	SeekerGate = GetLinkedRef(LinkCustom01)
	if (isCounted == FALSE)
		isCounted = TRUE
		(SeekerGate as DLC2ApoBook3SeekerDoorScript).GetSeekerNumber()
	endif
endEvent

Event OnDeath(Actor akKiller)
	;Notification ("I am Dead")
	(SeekerGate as DLC2ApoBook3SeekerDoorScript).CheckDead()
endEvent
