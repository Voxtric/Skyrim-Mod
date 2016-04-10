Scriptname DLC2MQ04NchardakReadingRoomScript extends ObjectReference  
{script on animating reading room}

DLC2MQ04Script Property DLC2MQ04  Auto  


event onCellAttach()
	; do nothing in these states
	if getState() == "done"
		return
	elseif getState() == "animating"
		gotoState("done")
		PlayAnimation("Stage2")
	else
		if DLC2MQ04.bReadingRoomPowered
		; intialize to the "open" state when steam is running
			gotoState("power")
	;		playAnimation("Open")
		else
			gotoState("noPower")
	;		playAnimation("Trigger01")
		endif
	endif
endEvent

auto state noPower
	; starts in this state
endState

; this can only be activated by its parent (button)
state power
	Event OnActivate(ObjectReference akActionRef)
		; make sure the steam is running
		if DLC2MQ04.bReadingRoomPowered 
			gotoState("animating")
			if playAnimationAndWait("Stage1", "Ready")
				gotoState("done")
			else
; 				debug.trace(self + " Unloaded during animation")
			endif
			; enable book
			GetLinkedRef().Enable()
			; make book part of room disappear
			PlayAnimation("Stage2")
			DLC2MQ04.SetStage(550)
		endif
	endEvent

endState

state done
; finished
endState

state animating
	
endState
