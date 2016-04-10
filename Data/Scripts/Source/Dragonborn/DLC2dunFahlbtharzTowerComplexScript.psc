Scriptname DLC2dunFahlbtharzTowerComplexScript extends ObjectReference  
{This script controls the complex tower in Fahlbtharz}

keyword property LinkCustom01 auto
keyword property LinkCustom02 auto
keyword property LinkCustom03 auto
keyword property LinkCustom04 auto
keyword property TrapLink auto

objectReference property DLC2dunFahlbtharzComplexTowerMarkerN auto
objectReference property DLC2dunFahlbtharzComplexTowerMarkerS auto
objectReference property DLC2dunFahlbtharzComplexTowerMarkerE auto
objectReference property DLC2dunFahlbtharzComplexTowerMarkerW auto

bool property Floor1 auto hidden
bool property Floor2 auto hidden

sound property OBJRotatingStonePillarLPM auto
sound property OBJRotatingStonePillarRelease auto
int property soundInstanceID auto hidden

float property waitTimer = 3.0 auto
bool property rumble = true auto

float ControllerShakeL = 0.4
float ControllerShakeR = 0.4


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

auto state waiting
	Event onActivate(ObjectReference akActivator)
; 		debug.Trace(self + ": has recieved onActivate")
		goToState("busy")
		if (akActivator as DLC2defaultTrackingIntScript)
			int activatorInt
			activatorInt = (akActivator as DLC2defaultTrackingIntScript).TrackingNumber
			ManageBridges(activatorInt)
		endif
		goToState("waiting")
	endEvent
endstate

state busy
endState

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Function ManageBridges(int floorNumber)
	doEffects()
	;Bottom floor is moving, change everything
; 	;debug.Trace(self + ": Managing Bridges; floorNumber = " + floorNumber)
	if floorNumber == 1
		;Toggle the boolean
		if Floor1
			Floor1 = False
		else
			Floor1 = true
		endif
		if getLinkedRef(LinkCustom04)
			self.EnableLinkChain(LinkCustom04)
		endif
		;This simulates the simple tower script for the bottom
		if Floor1
			if getLinkedRef(LinkCustom01)
				self.EnableLinkChain(LinkCustom01)
			endif
			if getLinkedRef()
				self.getLinkedRef().PlayAnimation("Forward")
			endif
			utility.wait(waitTimer)
			if OBJRotatingStonePillarRelease
				OBJRotatingStonePillarRelease.Play(getLinkedRef(LinkCustom03))
			endif
			if getLinkedRef(LinkCustom02)
				self.DisableLinkChain(LinkCustom02)
			endif
		else
			if getLinkedRef(LinkCustom02)
				self.EnableLinkChain(LinkCustom02)
			endif
			if getLinkedRef()
				self.getLinkedRef().PlayAnimation("Backward")
			endif
			utility.wait(waitTimer)
			if OBJRotatingStonePillarRelease
				OBJRotatingStonePillarRelease.Play(getLinkedRef(LinkCustom03))
			endif
			if getLinkedRef(LinkCustom01)
				self.DisableLinkChain(LinkCustom01)
			endif
		endif
		if getLinkedRef(LinkCustom04)
			self.disableLinkChain(LinkCustom04)
		endif
	else;floorNumber == 2
		;Toggle the boolean
		if Floor2
			Floor2 = False
			if getLinkedRef(TrapLink)
				self.getLinkedRef(TrapLink).PlayAnimation("Backward")
			endif
		else
			Floor2 = true
			if getLinkedRef(TrapLink)
				self.getLinkedRef(TrapLink).PlayAnimation("Forward")
			endif
		endif
	endif
	;Now Manage the second floor
	if Floor1
		if Floor2
; 			;debug.Trace(self + ": Floor1 = True Floor2 = True")
			DLC2dunFahlbtharzComplexTowerMarkerN.disable()
			DLC2dunFahlbtharzComplexTowerMarkerS.enable()
			DLC2dunFahlbtharzComplexTowerMarkerE.enable()
			DLC2dunFahlbtharzComplexTowerMarkerW.disable()
		else;!Floor2
; 			;debug.Trace(self + ": Floor1 = True Floor2 = False")
			DLC2dunFahlbtharzComplexTowerMarkerN.enable()
			DLC2dunFahlbtharzComplexTowerMarkerS.disable()
			DLC2dunFahlbtharzComplexTowerMarkerE.disable()
			DLC2dunFahlbtharzComplexTowerMarkerW.enable()
		endif
	else ;!Floor1
		if Floor2
; 			;debug.Trace(self + ": Floor1 = False Floor2 = True")
			DLC2dunFahlbtharzComplexTowerMarkerN.enable()
			DLC2dunFahlbtharzComplexTowerMarkerS.disable()
			DLC2dunFahlbtharzComplexTowerMarkerE.enable()
			DLC2dunFahlbtharzComplexTowerMarkerW.disable()
		else;!Floor2
; 			;debug.Trace(self + ": Floor1 = False Floor2 = False")
			DLC2dunFahlbtharzComplexTowerMarkerN.disable()
			DLC2dunFahlbtharzComplexTowerMarkerS.enable()
			DLC2dunFahlbtharzComplexTowerMarkerE.disable()
			DLC2dunFahlbtharzComplexTowerMarkerW.enable()
		endif
	endif
	Sound.StopInstance(soundInstanceID)
; 	;debug.Trace(self + ": Finished Managing Bridges")
; 	;debug.Trace(self + ": Floor1 Boolean = " + Floor1)
; 	;debug.Trace(self + ": Floor2 Boolean = " + Floor2)
endFunction


Function doEffects()
	if OBJRotatingStonePillarLPM
		soundInstanceID = OBJRotatingStonePillarLPM.Play(getLinkedRef(LinkCustom03))
	endif
	if rumble
		game.ShakeCamera(afStrength = 0.5)
		game.ShakeController(ControllerShakeL, ControllerShakeR, waitTimer)
	endif		
endFunction