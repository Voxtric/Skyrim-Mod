Scriptname DLC2DweRetractableStairScript extends ObjectReference

bool property startDown = True Auto

Event OnCellLoad()
	if (startDown)
		Self.PlayAnimation("StartLowered")
		GoToState("Lowered")
	Else
		GoToState("Raised")
	EndIf
EndEvent

State Raised
	Event OnActivate(ObjectReference obj)
		Self.PlayAnimationAndWait("Lower", "Done")
		GoToState("Lowered")
	EndEvent
EndState

State Lowered
	Event OnActivate(ObjectReference obj)
		Self.PlayAnimationAndWait("Raise", "Done")
		GoToState("Raised")
	EndEvent
EndState