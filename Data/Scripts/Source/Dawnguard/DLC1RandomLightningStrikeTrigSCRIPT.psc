Scriptname DLC1RandomLightningStrikeTrigSCRIPT extends ObjectReference 
{Used to give your whole dungeon the effect that it's unstable.}

import utility
import game

Float Property WaitForCastMax = 10.0 Auto
{Max time between strikes. DEFAULT = 10}
Float Property WaitForCastMin = 8.0 Auto
{Min time between strikes. DEFAULT = 8}

Spell Property LightningSpell Auto
{Lightning spell that randomly gets cast}

Bool Property IsConcentratedSpell = FALSE Auto
{If TRUE this will be casting a concentrated spell}

Float Property TimeBeforeInterruptingConcentratedSpell = 0.2 Auto
{Only happens if IsConcentratedSpell is TRUE, DEFAULT = 0.2}

Sound Property DistantImpactSound Auto
{Sound played on impact that the player can only hear if he's far away}

Sound Property CloseImpactSound Auto
{Sound played on impact that the player can only hear if he's close by}

Sound Property PreStrikeSound Auto
{Sound played just before the lightning strikes}

Float Property PreStrikeDelay = 1.0 Auto
{(Ignored if no PreStrikeSound has been assigned!) Time after PreStrikeSound has started to play before lightning actually strikes. (Default = 1)}

bool Property forceQuiet = FALSE Auto

	; Holds the closest actor to the strike point
ObjectReference ClosestActorToStrikePoint

	; Max link ref points counted
Int MaxLightningPoints

	; Current point we are casting too
Int CurrentCastPoint

	; Set to true OnCellAttach(), then false in OnUnload()
Bool ShouldCastLightning = FALSE

	; Sound instance that holds the CloseImpactSound effect when it plays
int CloseSoundinstanceID

	; Sound instance that holds the FarImpactSound effect when it plays
int FarSoundinstanceID

	; Sound instance that holds the PreStrikeSound effect when it plays
int PreStrikeSoundInstanceID


	; Counts the max strike points and starts the Lighting Strike loop.
Event OnCellAttach()

	MaxLightningPoints = GetLinkedRef().CountLinkedRefChain()

	ShouldCastLightning = TRUE

	HandleLightning()

EndEvent

	; While ShouldCastLighting is true a random time is picked between Min and Max, waits for that random time, then calls the casting function
Function HandleLightning()

	While(ShouldCastLightning == TRUE)
		Wait(RandomFloat(WaitForCastMin, WaitForCastMax))
			; If this trigger is unloaded don't bother casting the spell at all
		if(GetParentCell().IsAttached())
			CastLightingBolts()
		endif
	EndWhile

EndFunction

	; Picks a random cast point, casts the spell at it, and if it's a concentrated spell it will wait for the set time and interrupt the cast
Function CastLightingBolts()
	
		; If there is a PreStrikeSound play it then wait for the amount of time in PreStrikeDelay before the actual lightning strike
	if PreStrikeSound && (GetParentCell().IsAttached())
		PreStrikeSoundInstanceID = PreStrikeSound.play(self)
		Wait(PreStrikeDelay)
	endif
		; Double check that we are loaded before casting lightning
	if (GetParentCell().IsAttached())
		CurrentCastPoint = RandomInt(1, MaxLightningPoints)
			; Confirm that this link is even there
		if (GetNthLinkedRef(CurrentCastPoint).Is3dLoaded())
				; Confirm that the xMarker we are casting to is actually loaded
			if (GetNthLinkedRef(CurrentCastPoint).GetParentCell().IsAttached())	
				debug.Trace(self + "Cast Point " + CurrentCastPoint + " " + GetNthLinkedRef(CurrentCastPoint) + " IS loaded, so casting lightning at it.")	

	;			ClosestActorToStrikePoint = FindClosestActorFromRef(GetNthLinkedRef(CurrentCastPoint), 512.0)
	;				; If we've found an actor near the strike point then check if it's the player or not
	;			if (ClosestActorToStrikePoint)
	;				debug.Trace("An actor is close to the strike point, HIT HIM!")	
	;					; Yup, it's an actor, HIT IT
	;				LightningSpell.Cast(self, ClosestActorToStrikePoint)
	;				CloseSoundinstanceID = CloseImpactSound.play(ClosestActorToStrikePoint)
	;				FarSoundinstanceID = CloseImpactSound.play(ClosestActorToStrikePoint)
	;				if (IsConcentratedSpell == TRUE)
	;					Wait(TimeBeforeInterruptingConcentratedSpell)
	;					Self.InterruptCast()
	;				endif
	;				if ((ClosestActorToStrikePoint as Actor).IsDead())
	;				debug.Trace("TheActor was dead, RESURRECT HIM!")	
	;					(ClosestActorToStrikePoint as Actor).Resurrect()
	;				endif
	;			else
	;				debug.Trace("No actor near strike point, do normal stuff")
						; Nope, no actor, do normal stuff

					LightningSpell.Cast(self, GetNthLinkedRef(CurrentCastPoint))
					if (forceQuiet == FALSE)
						CloseSoundinstanceID = CloseImpactSound.play(GetNthLinkedRef(CurrentCastPoint))
						FarSoundinstanceID = CloseImpactSound.play(GetNthLinkedRef(CurrentCastPoint))
					endif
					if (IsConcentratedSpell == TRUE)
						Wait(TimeBeforeInterruptingConcentratedSpell)
						Self.InterruptCast()
					endif
	;			endif
			else
				debug.Trace(self + "Cast Point " + CurrentCastPoint + " " + GetNthLinkedRef(CurrentCastPoint) + " ISN'T loaded, so not casting lightning at it.")
			endif
		else
				debug.Trace(self + "Cast Point " + CurrentCastPoint + " " + GetNthLinkedRef(CurrentCastPoint) + " IS NULL, so not casting lightning at it.")
		endif
	endif

	ClosestActorToStrikePoint = NONE
	CurrentCastPoint = 0

EndFunction

	; When this trigger is unloaded the lightning casts should stop
Event OnCellDetach()
	ShouldCastLightning = FALSE
EndEvent
