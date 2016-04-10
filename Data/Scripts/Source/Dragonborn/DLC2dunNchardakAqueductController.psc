ScriptName DLC2dunNchardakAqueductController extends ObjectReference
{Activation manager for the aqueduct lever puzzle in Nchardak. Used to keep the puzzle state in sync and prevent multiple pedestals from being activated at once.}

ObjectReference property Bridge1 Auto
ObjectReference property Bridge2 Auto
ObjectReference property Bridge3 Auto

ObjectReference property BridgePedestal1 Auto
ObjectReference property BridgePedestal2 Auto
ObjectReference property BridgePedestal3 Auto

ObjectReference property Bridge1NavcutCollision Auto
ObjectReference property Bridge2NavcutCollision Auto
ObjectReference property Bridge3NavcutCollision Auto

Auto State WaitingForPlayer
	Event OnActivate (objectReference triggerRef)
; 		;Debug.Trace("Controller activated by: " + triggerRef)
		GoToState("Busy")
		triggerRef.Activate(Self)
	EndEvent
EndState

State Busy
	Event OnActivate (objectReference triggerRef)
		;Do nothing.
	EndEvent
EndState

Event OnCellAttach()
	UpdateBridgeCollision()
EndEvent

Function ActivationComplete()
; 	;Debug.Trace("Activation Complete Received")
	UpdateBridgeCollision()
	Utility.Wait(1.75)
; 	;Debug.Trace("Now ready to proceed.")
	GoToState("WaitingForPlayer")
EndFunction

Function UpdateBridgeCollision()
	if (((Bridge1 as default2StateActivator).IsOpen && !(Bridge1 as default2StateActivator).isAnimating) ||\
		(!(Bridge1 as default2StateActivator).IsOpen && (Bridge1 as default2StateActivator).isAnimating))
		Bridge1NavcutCollision.Enable()
	Else
		Bridge1NavcutCollision.Disable()
	EndIf
	
	if (((Bridge2 as default2StateActivator).IsOpen && !(Bridge2 as default2StateActivator).isAnimating) ||\
		(!(Bridge2 as default2StateActivator).IsOpen && (Bridge2 as default2StateActivator).isAnimating))
		Bridge2NavcutCollision.Enable()
	Else
		Bridge2NavcutCollision.Disable()
	EndIf
	
	if (((Bridge3 as default2StateActivator).IsOpen && !(Bridge3 as default2StateActivator).isAnimating) ||\
		(!(Bridge3 as default2StateActivator).IsOpen && (Bridge3 as default2StateActivator).isAnimating))
		Bridge3NavcutCollision.Enable()
	Else
		Bridge3NavcutCollision.Disable()
	EndIf
EndFunction

;Force the puzzle into a completed state.
Function SetPuzzleCompleted()
	;Force the puzzle pillars into the correct states.
	(BridgePedestal1 as DLC2dunNchardakPedestalScript).PlayAnimation("Forward")
	(BridgePedestal1 as DLC2dunNchardakPedestalScript).nextEventIsBackward = True
	(BridgePedestal2 as DLC2dunNchardakPedestalScript).PlayAnimation("Backward")
	(BridgePedestal2 as DLC2dunNchardakPedestalScript).nextEventIsBackward = True
	(BridgePedestal3 as DLC2dunNchardakPedestalScript).PlayAnimation("Forward")
	(BridgePedestal3 as DLC2dunNchardakPedestalScript).nextEventIsBackward = True
	
	;Lower all three bridges.
	if ((Bridge1 as default2StateActivator).IsOpen)
		Bridge1.Activate(Self)
	EndIf
	if ((Bridge2 as default2StateActivator).IsOpen)
		Bridge2.Activate(Self)
	EndIf
	if ((Bridge3 as default2StateActivator).IsOpen)
		Bridge3.Activate(Self)
	EndIf

	;Disable all the navcut collision, since the bridges are down.
	Bridge1NavcutCollision.Disable()
	Bridge2NavcutCollision.Disable()
	Bridge3NavcutCollision.Disable()
EndFunction