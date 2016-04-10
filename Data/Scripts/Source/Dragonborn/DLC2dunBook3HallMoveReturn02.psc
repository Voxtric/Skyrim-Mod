Scriptname DLC2dunBook3HallMoveReturn02 extends ObjectReference  

ObjectReference Property DoorClose auto

keyword Property LinkCustom01 auto

;objectReference Property SecondTrigger auto

;objectReference Property PlayerRef auto

ObjectReference BendingHall

Event OnCellAttach()
	BendingHall = GetLinkedRef(LinkCustom01)
endEvent

Event OnTriggerEnter(ObjectReference akActionRef)
;	SecondTrigger.Enable()
	Debug.SendAnimationEvent(BendingHall, "Return")
	DoorClose.Activate(self)
	self.Disable()

endEvent
