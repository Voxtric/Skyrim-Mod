Scriptname DLC2ApoExtendingHallScript extends default2stateActivator Conditional
{for any activator with standard open/close states}

import debug
import utility

string property fadeOutEndcapAnim = "Trigger03" auto
{animation to play when fading out endcap}

keyword property LinkCustom01 auto
string Property startClosedAnim = "StartTrigger02" auto
{Default = StartTrigger02}
bool Property bypassLoadSetDefaultState = false auto

;This has to be handled as a function, since OnLoad and OnReset can fire in either order, and we can't handle competing animation calls.
Function SetDefaultState()
	if (isOpen)
		;playAnimationandWait(startOpenAnim, openEvent)
		playAnimationAndWait(StartOpenAnim, openEvent)
; 		debug.Trace(self + ": Done playing StartOpenAnim")
		if getLinkedRef(LinkCustom01)
			getLinkedRef(LinkCustom01).disable(abFadeout = false)
			playAnimationandWait(fadeoutEndcapAnim, OpenEvent)
		endif
		if (zInvertCollision == FALSE)
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		endif

		myState = 0
	Else
		playAnimationandWait(startClosedAnim, closeEvent)
		if getLinkedRef(LinkCustom01)
			getLinkedRef(LinkCustom01).enable(abFadein = false)
		endif
		if (zInvertCollision == FALSE)
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		endif

		myState = 1
	EndIf
EndFunction


function SetOpen(bool abOpen = true)
	; if busy, wait to finish
	while getState() == "busy"
		wait(1)
	endWhile
	; open/close if necessary
	isAnimating = true
	if abOpen && !isOpen
		gotoState ("busy")
		trace(self + " Opening")
		if bAllowInterrupt == TRUE || !Is3DLoaded()
			playAnimation(openAnim) ; Animate Open
		else
			playAnimationandWait(openAnim, openEvent) ; Animate Open
		endif
		if getLinkedRef(LinkCustom01)
			playAnimationandWait(fadeoutEndcapAnim, OpenEvent)
			getLinkedRef(LinkCustom01).disable(abFadeout = True)
		endif
		trace(self + " Opened")

		if (zInvertCollision == FALSE)
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		endif

		isOpen = true
		gotoState("waiting")
	elseif !abOpen && isOpen
		gotoState ("busy")
		trace(self + " Closing")
		if getLinkedRef(LinkCustom01)
			getLinkedRef(LinkCustom01).enable(abFadein = True)
		endif
		if bAllowInterrupt == TRUE || !Is3DLoaded()
			playAnimation(closeAnim)
		else
			playAnimationandWait(closeAnim, closeEvent) ; Animate Closed
		endif
		trace(self + " Closed")
		
		if (zInvertCollision == FALSE)
			trace(self + " Enabling Collision")
			EnableLinkChain(TwoStateCollisionKeyword)
		else
			trace(self + " Disabling Collision")
			DisableLinkChain(TwoStateCollisionKeyword)
		endif

		isOpen = false
		gotoState("waiting")
	endif
	isAnimating = false
endFunction

EVENT OnLoad()
	if !bypassLoadSetDefaultState
		SetDefaultState()
	endif
endEVENT

Event OnReset()
	SetDefaultState()
EndEvent