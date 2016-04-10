Scriptname DLC2dunKolbjornRotDoorChainScript extends ObjectReference
{Script for the pull chains that control the rotating doors in Kolbjorn Barrow.}

Sound property DRSStoneRotatingDiscLPM auto
int SFXInstance
bool GoToOnState

Auto State Off
	Event OnActivate(ObjectReference akActivator)
		GoToState("Busy")
		Self.BlockActivation(True)
		Self.RegisterForAnimationEvent(Self, "Reset")
		Self.PlayAnimation("Pull")
		Utility.Wait(1)
		Self.GetLinkedRef().PlayAnimation("rotateLeft")
		SFXinstance = DRSStoneRotatingDiscLPM.Play(Self.GetLinkedRef())
		GoToOnState = True
	EndEvent
EndState

State On
	Event OnActivate(ObjectReference akActivator)
		GoToState("Busy")
		Self.BlockActivation(True)
		Self.RegisterForAnimationEvent(Self, "Reset")
		Self.PlayAnimation("Pull")
		Utility.Wait(1)
		Self.GetLinkedRef().PlayAnimation("stop")
		Sound.StopInstance(SFXInstance)
		GoToOnState = False
	EndEvent
EndState

State Busy
	Event OnActivate(ObjectReference akActivator)
		;Do Nothing
	EndEvent
EndState

Function OnAnimationEvent(ObjectReference source, String eventName)
	Self.BlockActivation("False")
	if (GoToOnState)
		GoToState("On")
	Else
		GoToState("Off")
	EndIf
EndFunction
