Scriptname DLC2DBBookLevelLightTrigSCRIPT extends ObjectReference Hidden 

Bool Property bIsPlaytesting = FALSE Auto
{Set to TRUE if you want to playtest your level without taking damage (TGM doesn't work with this enabled)(DEFAULT is FALSE)}

Bool Property bShowDebugTraces = FALSE Auto
{(Default = FALSE)}

Sound Property sDamageFromDarkSound auto
{Sound effect to play when taking damage from darkness}

ImageSpaceModifier Property imodDamgeFromDarkImagespaceModifier auto
{Imagespace Modifier to crossfade to while taking damage from darkness}

Bool bCheckLightLevel
Bool bDoDamage
Bool bDoingDamage
Int iDamageSoundID

Float fPlayersHealthOnLoad
Float fPlayersHealthPercentOnLoad
Float fAmountToDamageThePlayer
Float fPlayersTotalHealth

Event OnCellAttach()
	bCheckLightLevel = TRUE
	CheckPlayerHealthPercentage()
	While bCheckLightLevel == TRUE
		if bShowDebugTraces
; 			debug.Trace("Player Light Level is " + Game.GetPlayer().GetLightLevel())
		endif
		if Game.GetPlayer().GetLightLevel() < 30
			if bShowDebugTraces
; 				debug.Trace("Level is low, do damage!")
			endif
			bDoDamage = TRUE
			if (bDoingDamage == FALSE)
				self.Activate(self)
			endif
		else
			bDoDamage = FALSE
		endif
		utility.Wait(0.1)
	EndWhile

EndEvent

Event OnActivate(ObjectReference akActionRef)
	DoTheDamage()
EndEvent

Function DoTheDamage()
	While bDoDamage == TRUE
		if !bDoingDamage
			iDamageSoundID = sDamageFromDarkSound.play(Game.GetPlayer())
			if (bIsPlaytesting == FALSE)
				imodDamgeFromDarkImagespaceModifier.ApplyCrossFade(4)
			endif
		endif
		bDoingDamage = TRUE
		if (bIsPlaytesting == FALSE)
			Game.GetPlayer().DamageActorValue("Health", fAmountToDamageThePlayer)
		endif
		if bShowDebugTraces
; 			debug.Trace("Players Health on Load was " + fPlayersHealthOnLoad + ", Percentage on load was " + fPlayersHealthPercentOnLoad)
; 			debug.Trace("   Players total health is " + fPlayersTotalHealth + ", amount to damage the player is " + fAmountToDamageThePlayer)
; 			debug.Trace("Taking damage from darkness!")
		endif
		utility.Wait(0.25)
	EndWhile
	Sound.StopInstance(iDamageSoundID) 
	if (bIsPlaytesting == FALSE)
		ImageSpaceModifier.RemoveCrossFade(0.5)
	endif
	bDoingDamage = FALSE
EndFunction

Event OnCellDetach()
	bCheckLightLevel = FALSE
	bDoDamage = FALSE
EndEvent

Function CheckPlayerHealthPercentage()
;Float fPlayersHealthOnLoad
;Float fPlayersHealthPercentOnLoad
;Float fAmountToDamageThePlayer
;Float fPlayersTotalHealth

	fPlayersHealthOnLoad = Game.GetPlayer().GetActorvalue("Health")
	fPlayersHealthPercentOnLoad = Game.GetPlayer().GetActorValuePercentage("Health")

	;(100 / percentage) * current = Max Health
	fPlayersTotalHealth = ((100 / (100 *fPlayersHealthPercentOnLoad)) * fPlayersHealthOnLoad)
	fAmountToDamageThePlayer = (fPlayersTotalHealth * 0.01)
EndFunction