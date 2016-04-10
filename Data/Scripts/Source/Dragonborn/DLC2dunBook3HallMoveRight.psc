Scriptname DLC2dunBook3HallMoveRight extends ObjectReference  
import Debug
import Utility

keyword Property LinkCustom01 auto

;objectReference Property PlayerRef auto

ObjectReference BendingHall

Event OnCellAttach()
	BendingHall = GetLinkedRef(LinkCustom01)
endEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	Debug.SendAnimationEvent(BendingHall, "Right")
	;Notification("DISABLED")
	self.Disable()
endEvent