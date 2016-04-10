Scriptname DLC2dunFahlbtharzTowerSimpleScript extends ObjectReference  
{This script provides controls for all simple towers}


keyword property LinkCustom01 auto
keyword property LinkCustom02 auto
keyword property LinkCustom03 auto

sound property OBJRotatingStonePillarLPM auto
sound property OBJRotatingStonePillarRelease auto
int property soundInstanceID auto hidden

float property waitTimer = 3.0 auto
bool property rumble = true auto

float ControllerShakeL = 0.4
float ControllerShakeR = 0.4


auto state closed
	event onActivate(ObjectReference akActivator)
		goToState("busy")
		if getLinkedRef(LinkCustom01)
			self.EnableLinkChain(LinkCustom01)
		endif
		doEffects()
		if getLinkedRef()
			;self.getLinkedRef().activate(self)
			self.getLinkedRef().playAnimation("Forward")
		endif
		utility.wait(waitTimer)
		Sound.StopInstance(soundInstanceID)
		if OBJRotatingStonePillarRelease
			OBJRotatingStonePillarRelease.Play(getLinkedRef(LinkCustom03))
		endif
		if getLinkedRef(LinkCustom02)
			self.DisableLinkChain(LinkCustom02)
		endif
		goToState("open")
	endEvent
endState
	

state busy
endState

state open
	event onActivate(ObjectReference akActivator)
		goToState("busy")
		if getLinkedRef(LinkCustom02)
			self.EnableLinkChain(LinkCustom02)
		endif
		doEffects()
		if getLinkedRef()
			self.getLinkedRef().activate(self)
			self.getLinkedRef().playAnimation("Backward")
		endif
		utility.wait(waitTimer)
		Sound.StopInstance(soundInstanceID)
		if OBJRotatingStonePillarRelease
			OBJRotatingStonePillarRelease.Play(getLinkedRef(LinkCustom03))
		endif
		if getLinkedRef(LinkCustom01)
			self.DisableLinkChain(LinkCustom01)
		endif
		goToState("closed")
	endEvent
endState


Function doEffects()
	if OBJRotatingStonePillarLPM
		soundInstanceID = OBJRotatingStonePillarLPM.Play(getLinkedRef(LinkCustom03))
	endif
	if rumble
		game.ShakeCamera(afStrength = 0.5)
		game.ShakeController(ControllerShakeL, ControllerShakeR, waitTimer)
	endif		
endFunction