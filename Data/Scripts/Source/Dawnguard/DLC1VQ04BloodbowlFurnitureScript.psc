Scriptname DLC1VQ04BloodbowlFurnitureScript extends ObjectReference
{This script listens for the event that says the blood is in the bowl and sets a stage on the quest}


Quest Property DLC1VQ04 auto
int Property Stage = 90 auto
objectReference Property DLC1SeranaRef auto

float property rumbleAmount1 = 0.5 Auto
float property rumbleDuration = 7.0 Auto
float property cameraShakeAmount1 = 0.8 Auto

auto state waiting
	event onActivate(objectReference ActivateRef)
		if ActivateRef == DLC1SeranaRef
			debug.Trace(self + ": activated by Serana, waiting for Trigger04")
			RegisterForAnimationEvent(DLC1SeranaRef, "Trigger04")
			goToState("Busy")
		endif
	endEvent
endState

state busy
endState

state Done
	event onBeginState()
		UnregisterForAnimationEvent(DLC1SeranaRef, "Trigger04")
		Self.PlayAnimationAndWait("Trigger04","Done")
		utility.wait(1.0)
		game.ShakeController(rumbleAmount1, rumbleAmount1, rumbleDuration)
		game.ShakeCamera(none, cameraShakeAmount1, rumbleDuration)
		DLC1VQ04.SetStage(stage)
	endEvent
endState

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	;debug.Trace(self + ": Has recieved AnimationEvent")
	;debug.Trace("---------akSource = " + akSource)
	;debug.Trace("---------akEventName = " + asEventName)
	if asEventName == "Trigger04" && akSource == DLC1SeranaRef
		goToState("Done")
	endif
endEvent
