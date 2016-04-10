Scriptname DLC2DBMiscBookLeve1LightSCRIPT extends ObjectReference Hidden 

Cell Property myCell Auto

Bool bDoDamage
Bool bDoingDamage
Bool bStartTranslation
Int iLinkChainCount
Int iCurrentLinkTarget

Event OnCellAttach()
	if (GetLinkedRef())
		utility.Wait(3)
		iLinkChainCount = CountLinkedRefChain()
		bStartTranslation = TRUE
		self.Activate(self)
	endif

	While self == self
; 		debug.Trace("Player Light Level is " + Game.GetPlayer().GetLightLevel())
		if Game.GetPlayer().GetLightLevel() < 30
; 			debug.Trace("Level is low, do damage!")
			bDoDamage = TRUE
			if (bDoingDamage == FALSE)
				self.Activate(self)
			endif
		else
; 			;debug.Trace("Level is high, DONT do damage!")
			bDoDamage = FALSE
		endif
		utility.Wait(0.5)
	EndWhile
EndEvent

Event OnActivate(ObjectReference akActionRef)
	DoTheDamage()

	if (bStartTranslation == TRUE)
		bStartTranslation = FALSE
		DoLightMovement()
	endif

EndEvent

Function DoLightMovement()
; 	debug.Trace("Starting Light Translation")
	self.TranslateToRef(GetNthLinkedRef(iCurrentLinkTarget), 200, 0)
EndFunction

Event OnTranslationAlmostComplete()
; 	debug.Trace("Translation Almost Complete!")
	iCurrentLinkTarget = iCurrentLinkTarget + 1
	if iCurrentLinkTarget <= iLinkChainCount
		DoLightMovement()
	endif
EndEvent

Function DoTheDamage()
	While bDoDamage == TRUE
		bDoingDamage = TRUE
		Game.GetPlayer().DamageActorValue("Health", 5)
; 		debug.Trace("Lower players health by -5 to " + Game.GetPlayer().GetActorValue("Health"))
		utility.Wait(0.5)
	EndWhile
	bDoingDamage = FALSE
EndFunction


Event OnTriggerEnter(ObjectReference akActionRef)
; 	debug.trace("Player has ENTERED the trigger")
EndEvent


Event OnTriggerLeave(ObjectReference akActionRef)
; 	debug.trace("Player has LEFT the trigger")
EndEvent