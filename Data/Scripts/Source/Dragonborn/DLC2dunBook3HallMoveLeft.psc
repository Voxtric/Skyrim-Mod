Scriptname DLC2dunBook3HallMoveLeft extends ObjectReference  

keyword Property LinkCustom01 auto

;objectReference Property PlayerRef auto

ObjectReference BendingHall

Event OnCellAttach()
	BendingHall = GetLinkedRef(LinkCustom01)
endEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	Debug.SendAnimationEvent(BendingHall, "Left")
	self.Disable()
endEvent
