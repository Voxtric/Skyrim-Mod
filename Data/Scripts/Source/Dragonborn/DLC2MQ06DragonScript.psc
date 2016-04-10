Scriptname DLC2MQ06DragonScript extends Actor  Conditional

ObjectReference Property LandingMarkerFar  Auto  
{landing marker on the far side of the water
where he lands prior to MQ06}

ObjectReference Property LandingMarkerNear  Auto  
{where he lands when MQ06 is active, prior to being tamed}

Quest Property DLC2MQ06 Auto

event OnCellAttach()
	if DLC2MQ06.GetStage() < 250
; 		debug.trace(self + " setting landing marker to FAR (temple)")
		SetForcedLandingMarker(LandingMarkerFar)
	elseif DLC2MQ06.GetStage() >= 250 && DLC2MQ06.GetStage() < 550
; 		debug.trace(self + " setting landing marker to NEAR (player accessible)")
		SetForcedLandingMarker(LandingMarkerNear)
	endif
	; NOTE: stage 550 clears the landing marker, so he'll act normally after that
endEvent

