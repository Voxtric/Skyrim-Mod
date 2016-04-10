Scriptname DLC2dunBook3HallReturn01 extends ObjectReference   

keyword Property LinkCustom01 auto

objectReference Property SecondTrigger auto
ObjectReference Property DoorClose auto

;objectReference Property PlayerRef auto

ObjectReference BendingHall

Event OnCellAttach()
	BendingHall = GetLinkedRef(LinkCustom01)
endEvent

Event OnTriggerEnter(ObjectReference akActionRef)
	SecondTrigger.Enable()
	Debug.SendAnimationEvent(BendingHall, "Return")
	DoorClose.Activate(self)
	self.Disable()
endEvent
