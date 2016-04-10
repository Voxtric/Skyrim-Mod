Scriptname DLC2ToldarsTombPuzzlePlateSCRIPT extends ObjectReference Hidden 
;
;
;
;================================================================

bool property ShowDebugMessages = TRUE auto

sound property TriggerSound auto


auto STATE WaitingForTrigger
		; Lower the plate and send the hit to the master trigger
	Event OnTriggerEnter(ObjectReference TriggerRef)
		if (ShowDebugMessages)
; 			debug.Trace("In STATE 'WaitingForTrigger' ENTERED plate " + self)
		endif
		GoToState("BeenTriggered")
		PlayAnimation("Down")
		TriggerSound.play(self)
		(GetLinkedRef() as DLC2ToldarsTombPuzzlePlatMasterSCRIPT).PressurePlateHit(TRUE)
	EndEvent
EndSTATE


STATE BeenTriggered
	Event OnTriggerEnter(ObjectReference TriggerRef)
		if (ShowDebugMessages)
; 			debug.Trace("In STATE 'BeenTriggered' ENTERED plate " + self)
		endif
		GoToState("BeenTriggered")
		PlayAnimation("Down")
		TriggerSound.play(self)
		(GetLinkedRef() as DLC2ToldarsTombPuzzlePlatMasterSCRIPT).PressurePlateHit(FALSE)
	EndEvent

	Event OnTriggerLeave(ObjectReference TriggerRef)
		if (ShowDebugMessages)
; 			debug.Trace("In STATE 'BeenTriggered' LEFT plate " + self)
		endif
		PlayAnimation("Up")
		TriggerSound.play(self)
	EndEvent

EndSTATE


STATE PuzzleSolved
	Event OnBeginState()
		if (ShowDebugMessages)
; 			debug.Trace("I've been set to the PuzzleSolved STATE" + self)
		endif
	EndEvent
EndSTATE

STATE Suspended
	Event OnBeginState()
		if (ShowDebugMessages)
; 			debug.Trace("I've been set to the Suspended STATE" + self)
		endif
	EndEvent
EndSTATE


Event OnActivate(ObjectReference akActionRef)
	if (ShowDebugMessages)
; 		debug.Trace("I've been activated, resetting!" + self)
	endif
	GoToState("WaitingForTrigger")
	PlayAnimation("Down")
	TriggerSound.play(self)
	utility.Wait(0.25)
	PlayAnimation("Up")
	TriggerSound.play(self)
EndEvent