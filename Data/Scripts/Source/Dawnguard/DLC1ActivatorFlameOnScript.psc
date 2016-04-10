Scriptname DLC1ActivatorFlameOnScript extends ObjectReference  

objectReference Property flameSource auto
sound Property FXFireFlameStart auto

Auto State Waiting
	Event onActivate(objectReference triggerRef)
		utility.wait(1)
		FXFireFlameStart.play(flameSource)
		self.getLinkedRef().enable(1)
		gotoState("Done")
	EndEvent
EndState

State Done
;do nothing
EndState
