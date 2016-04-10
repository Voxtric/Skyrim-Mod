Scriptname FerrySystemScript extends Quest  Conditional

import game

; remove gold and travel
function Travel(int iDestination = -1, Actor pDriver)
 	debug.trace(self + " Travel to " + iDestination)
	currentDestination = iDestination
	currentDriver = pDriver

	; try two ways for testing:
	if bWaitForPlayerToSit 
		; just start watching for player to sit
		PlayerRider.ForceRefTo(pDriver.GetLinkedRef(DLC1LinkFerrySeat1))
		PlayerRider2.ForceRefTo(pDriver.GetLinkedRef(DLC1LinkFerrySeat2))
		currentDriver.SetActorValue("variable01", 3) ; to allow "waiting" chatter
		; if player is sitting already, let's go
		ObjectReference sitMarker1 = pDriver.GetLinkedRef(DLC1LinkFerrySeat1)
		ObjectReference sitMarker2 = pDriver.GetLinkedRef(DLC1LinkFerrySeat2)
		; we can only check if furniture is in use, not who's sitting in it
		if sitMarker1.IsFurnitureInUse() || sitMarker2.IsFurnitureInUse()
			PlayerRider.Clear()
			PlayerRider2.Clear()
			PlayerIsSitting()
		endif
	else
		
		if currentDestination >= 1 && currentDestination < 4
			GetPlayer().RemoveItem(Gold, DLC1FerryCostSmall.value as int)
		else
			GetPlayer().RemoveItem(Gold, DLC1FerryCostLarge.value as int)
		endif
		

		; get player to sit in marker
		ObjectReference sitMarker1 = pDriver.GetLinkedRef(DLC1LinkFerrySeat1)
		ObjectReference sitMarker2 = pDriver.GetLinkedRef(DLC1LinkFerrySeat2)
		if sitMarker1.IsFurnitureInUse()
			sitMarker1.Activate(Game.GetPlayer())
		elseif sitMarker2.IsFurnitureInUse()
			sitMarker2.Activate(Game.GetPlayer())
		endif
		RegisterForSingleUpdate(1)
	endif
endFunction

function ClearWaitingState()
; 	debug.trace(self + "ClearWaitingState(): currentDriver=" + currentDriver)
	currentDriver.SetActorValue("variable01", 0)
	currentDriver = None
	currentDestination = -1
	PlayerRider.Clear()
	PlayerRider2.Clear()
endFunction

function PlayerIsSitting()
 	debug.trace(self + " PlayerIsSitting")
	actor player = Game.GetPlayer()

	; if driver is dead, clear and return
	if currentDriver.IsDead()
		ClearWaitingState()
		return
	endif

	; no riding while in combat (because you can't actually sit)
	if player.IsInCombat()
		return
	endif

	; no riding while encumbered (fast travel will fail)
	if player.GetActorValue("InventoryWeight") > player.getActorValue("CarryWeight")
; 		debug.trace(self + " player is encumbered - do nothing")
		return
	endif

	Game.DisablePlayerControls()
	;CarriageDriverScript driverScript = (currentDriver as ObjectReference) as CarriageDriverScript
	;if driverScript && driverScript.bSitting
	;	currentDriver.PlayIdle(IdleCartDriverIdle)
	;endif
	
	if currentDestination >= 1 && currentDestination < 4
		player.RemoveItem(Gold, DLC1FerryCostSmall.value as int)
	else
		player.RemoveItem(Gold, DLC1FerryCostLarge.value as int)
	endif
	
;	Game.FadeOutGame(true, true, 0.5, 8)
	currentDriver.SetActorValue("variable01", 2) ; to allow chatter
	currentDriver.Say(DialogueCarriageChatterTopic)
	currentDriver.SetActorValue("variable01", 0) ; turn it back off
	utility.wait(2)
	FadeToBlackImod.Apply()
	utility.wait(2)
	FadeToBlackImod.PopTo(FadeToBlackHoldImod)
	utility.wait(2)
	SkipToDestinationSimple()
endFunction

event OnUpdate()
	; player has asked to travel, single update to prevent function call from blocking
	currentDriver.SetActorValue("variable01", 2) ; to allow chatter
	currentDriver.Say(DialogueCarriageChatterTopic)
	utility.wait(6)
	currentDriver.SetActorValue("variable01", 0) ; turn it back off
	SkipToDestinationSimple()
endEvent

function SkipToDestinationSimple()
; 	debug.trace(self + "SkipToDestinationSimple START: travel to " + currentDestination)

	; fast travel to current destination
	if currentDestination == 1
		FastTravel(Windhelm)
	elseif currentDestination == 2
		FastTravel(Solitude)
	elseif currentDestination == 3
		FastTravel(Dawnstar)
	elseif currentDestination == 4
		FastTravel(CastleVolkihar)
	else
; 		debug.trace(self + "SkipToDestinationSimple: FAILED - bad destination")
	endif
	FadeToBlackHoldImod.PopTo(FadeToBlackBackImod)
	FadeToBlackHoldImod.Remove()
;	Game.FadeOutGame(False, true, 1, 2)
	ClearWaitingState()
	EnablePlayerControls()
; 	debug.trace(self + "SkipToDestination DONE")
endFunction

Keyword Property DLC1LinkFerrySeat1 Auto
Keyword Property DLC1LinkFerrySeat2 Auto

GlobalVariable Property DLC1FerryCostSmall Auto
GlobalVariable Property DLC1FerryCostLarge Auto

bool Property bWaitForPlayerToSit = true Auto Conditional

MiscObject Property Gold  Auto  

Topic Property DialogueCarriageChatterTopic Auto

Actor property currentDriver auto		; save current driver for update loop


ObjectReference Property Solitude  Auto  

ObjectReference Property Windhelm  Auto  

ObjectReference Property Dawnstar  Auto  

ObjectReference Property CastleVolkihar Auto

; ***********************
; REAL CART STUFF
;************************
import ObjectReference

int property currentDestination auto conditional
{ where is the player currently traveling?
	Not traveling = 0
	Windhelm = 1
	Solitude = 2
	Dawnstar = 3
	Castle Volkihar = 4
}


function SkipToDestination()
; 	debug.trace(self + "SkipToDestination START")

	; fast travel to current destination
	Game.FadeOutGame(true, true, 0.5, 3)
	; reset all carts
	ResetAllDrivers()

	if currentDestination == 1
		FastTravel(Windhelm)
	elseif currentDestination == 2
		FastTravel(Solitude)
	elseif currentDestination == 3
		FastTravel(Dawnstar)
	elseif currentDestination == 4
		FastTravel(CastleVolkihar)
	endif
	Game.FadeOutGame(False, true, 1, 2)
; 	debug.trace(self + "SkipToDestination DONE")
endFunction

;**************************
; utility functions
;**************************
function DisableAllOtherDrivers(ObjectReference myDriver)
	if SolitudeFerryman.GetRef() != myDriver
		SolitudeFerryman.TryToDisable()
	endif
	if DawnstarFerryman.GetRef() != myDriver
		DawnstarFerryman.TryToDisable()
	endif
	if WindhelmFerryman.GetRef() != myDriver
		WindhelmFerryman.TryToDisable()
	endif
endFunction

function ResetAllDrivers()
; 	debug.trace(self + " ResetAllDrivers() BEGIN")
	ResetDriver(SolitudeFerryman)
	ResetDriver(DawnstarFerryman)
	ResetDriver(WindhelmFerryman)
; 	debug.trace(self + " ResetAllDrivers() END")
endFunction

function ResetDriver(ReferenceAlias driverAlias)
	ObjectReference driverRef = driverAlias.GetRef()
	(driverRef as CartDriverScript).ResetLocation()
endFunction

ReferenceAlias Property CartRiderPlayer  Auto  

Topic Property ArrivalTopic  Auto  

ReferenceAlias Property SolitudeFerryman Auto
ReferenceAlias Property DawnstarFerryman Auto
ReferenceAlias Property WindhelmFerryman Auto


GlobalVariable Property CarriageAllowCWDisable  Auto  
{set this to 0 when riding - prevents CW scripts from enabling/disabling carts}

GlobalVariable Property SittingAngleLimit  Auto  
{global to change the angle you can look while seated}

Idle Property ExitCartBegin  Auto  

Idle Property ExitCartEnd  Auto  

Idle Property IdleCartExitInstant  Auto  

GlobalVariable Property TestCartQuickExit  Auto  

ReferenceAlias Property PlayerRider  Auto  
ReferenceAlias Property PlayerRider2  Auto  

ImageSpaceModifier Property FadeToBlackImod  Auto  

ImageSpaceModifier Property FadeToBlackHoldImod  Auto  

ImageSpaceModifier Property FadeToBlackBackImod  Auto  


