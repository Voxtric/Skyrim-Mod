Scriptname DLC2DBBookLevelLightTranslationSCRIPT extends ObjectReference Hidden 

Float Property fMovementSpeed = 50.0 Auto
{Speed the light will move at.  Default = 50}

Bool Property bShowDebugTraces = FALSE Auto
{(Default = FALSE)}

Int Property iMovementType = 0 Auto
{0 = Ping Pong: The light will transition back through it's linked chain once it's reached the end. (DEFAULT)
1 = Reset: The light will reset (MoveTo()) the first linked ref in the chain once it's reached the end.
2 = Looping: The light will transition to it's first linked ref from the last one in the chain.}

Bool bStartTranslation
Bool bMovingForward
Bool bPlayerCurrentlyInCell
Int iLinkChainCount
Int iCurrentLinkTarget

Event OnCellAttach()
	bPlayerCurrentlyInCell = TRUE
	if (GetLinkedRef())
		bMovingForward = TRUE
		iLinkChainCount = CountLinkedRefChain() - 1
		if bShowDebugTraces
; 			debug.Trace("iLinkChainCount = " + iLinkChainCount)
		endif
		bStartTranslation = TRUE
		self.MoveTo(GetLinkedRef())
		DoLightMovement()
	endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if (GetLinkedRef())
		if bPlayerCurrentlyInCell
			if (self.IsDisabled() == FALSE) && (GetLinkedRef())
				bMovingForward = TRUE
				iLinkChainCount = CountLinkedRefChain() - 1
				if bShowDebugTraces
; 					debug.Trace("iLinkChainCount = " + iLinkChainCount)
				endif
				bStartTranslation = TRUE
				self.MoveTo(GetLinkedRef())
				DoLightMovement()
			endif	
		endif
	endif
EndEvent

Event OnLoad()
	if (GetLinkedRef())
		if bShowDebugTraces
; 			debug.Trace("I've Loaded!")
		endif
		if (bPlayerCurrentlyInCell)
			HandleTransitionEnd()
		endif
	endif
EndEvent

Event OnCellDetach()
	bPlayerCurrentlyInCell = FALSE
EndEvent

Function DoLightMovement()
	if (GetLinkedRef())
		if bShowDebugTraces
; 			debug.Trace("Starting Light Translation")
		endif
		if (self.IsDisabled() == FALSE)
			self.TranslateToRef(GetNthLinkedRef(iCurrentLinkTarget), fMovementSpeed, 0)
		endif
	endif
EndFunction

Event OnTranslationComplete()
	if (GetLinkedRef())
		if (iMovementType == 1) ;Reset
			if (self.IsDisabled() == FALSE)
				HandleTransitionEnd()
			endif
		endif
	endif
EndEvent


Event OnTranslationAlmostComplete()
	if (GetLinkedRef())
		if (iMovementType == 0) || (iMovementType == 2) ;Ping Pong or Looping
			if (self.IsDisabled() == FALSE)
				HandleTransitionEnd()
			endif
		endif
	endif
EndEvent


Function HandleTransitionEnd()
	if (GetLinkedRef())
		if bShowDebugTraces
; 			debug.Trace("Translation Almost Complete!")
		endif
		if bMovingForward == TRUE
			if bShowDebugTraces
; 				debug.Trace("Light is currently moving foward")
			endif
			iCurrentLinkTarget = iCurrentLinkTarget + 1
			if iCurrentLinkTarget <= iLinkChainCount
				if bShowDebugTraces
; 					debug.Trace("Current link " + iCurrentLinkTarget + " is less than chain count " + iLinkChainCount)
				endif
				DoLightMovement()
			else
				if iMovementType == 0 ;Ping Pong
					if bShowDebugTraces
; 						debug.Trace("I'm a PING PONG light! Reverse Direction!")
					endif
					bMovingForward = FALSE
					DoLightMovement()
				endif
				if iMovementType == 1 ;Reset
					if bShowDebugTraces
; 						debug.Trace("I'm a RESET light! Start over!")
					endif
					self.MoveTo(GetLinkedRef())
					iCurrentLinkTarget = 0
					DoLightMovement()
				endif
				if iMovementType == 2 ;Looping
					if bShowDebugTraces
; 						debug.Trace("I'm a LOOPING light! Transition to beginning!")
					endif
					iCurrentLinkTarget = 0
					DoLightMovement()
				endif
			endif
		elseif bMovingForward == FALSE
			if bShowDebugTraces
; 				debug.Trace("Light is currently moving backward")
			endif
			iCurrentLinkTarget = iCurrentLinkTarget - 1
			if iCurrentLinkTarget >= 0
				if bShowDebugTraces
; 					debug.Trace("Current link " + iCurrentLinkTarget + " is less than zero")
				endif
				DoLightMovement()
			else
				bMovingForward = TRUE
				DoLightMovement()
			endif
		endif
	endif
EndFunction