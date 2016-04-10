Scriptname DLC2TameDragonScript extends Quest  Conditional

bool bAllowRestrain = false 	; this gets set to true at the start of Tame sequence, false during EndWait to prevent accidentally rerestraining him

function TameDragon(actor newDragon)
; 	debug.trace(self + " TameDragon START")
	; if alias already has something in it (that's alive), do nothing
	if dragonReleasedAlias.GetRef() && !dragonReleasedAlias.GetActorRef().IsDead()
		; do nothing, dragon is in the process of being released
; 			debug.trace(self + " TameDragon: time's up, do nothing")
			; if this is not the current target, give a message
;			if dragonReleasedAlias.GetRef() != newDragon
				DLC2TameDragonResistMSG.Show()
;			endif
			return
	elseif DragonAlias.GetRef() && !dragonAlias.GetActorRef().IsDead()
		; if we're hitting a tamed dragon again, tell him to land
		; otherwise, do nothing (can't tame 2 dragons at once)
		if DragonAlias.GetActorRef() == newDragon && newDragon.GetActorValue("variable01") != 99
			; we're hitting an already tamed dragon with tame again - tell him to land
			LandDragon()
		else
			; show "resists" message
			DLC2TameDragonResistMSG.Show()
		endif
		; no matter what - don't do anything else
		return
	endif
; 	debug.trace(self + " TameDragon: trying to tame...")
	; if dragon is not in an interior, then check if it's in an allowed worldspace - if not, do nothing
	if !newDragon.IsInInterior() && !DLC2TameDragonAllowedWorldspaces.HasForm(newDragon.GetWorldSpace())
; 		debug.trace(self + " TameDragon: dragon is in invalid worldspace + " + newDragon.GetWorldSpace() + ", do nothing")
		return
	endif

	; reset allow restrain flag
	bAllowRestrain = true

	; move orbit marker to player's position
	DLC2TameDragonOrbitMarker.Moveto(Game.GetPlayer())

	; always hold him on the ground to start
	; give "no fly" ability so it doesn't interfere with scripted "no fly"
	newDragon.AddSpell(DLC2TameDragonNoFlyAbility)

	; put dragon in alias
	DragonAlias.ForceRefTo(newDragon)
	; stop combat
	newDragon.StopCombatAlarm()
	
	; start scene
	; check for special case: MQ06
	if newDragon.IsInFaction(DLC2MQ06DragonFaction) && DLC2MQ06.GetStage() >= 10 && DLC2MQ06.GetStage() < 300
		; this is the MQ06 dragon - first time tamed
		bMQ06DragonTaming = true
		DLC2MQ06TameDragonScene.Start()
	else
		bMQ06DragonTaming = false
		DLC2TameDragonScene1.Start()
	endif

	; heal the dragon
	newDragon.RestoreActorValue("Health", 9999)
endFunction

; call this function to get the dragon to briefly land next to the player
function LandDragon()
; 	debug.trace(self + " LandDragon: dragon " + dragonAlias.GetRef() + " landing again")
	Actor dragonActor = dragonAlias.GetActorRef()
	; reset actor value
	if dragonActor.GetActorValue("variable01") != 99
		dragonActor.SetActorValue("Variable01", 0)	
	else
		return
	endif

	; move orbit marker to player's position
	DLC2TameDragonOrbitMarker.Moveto(Game.GetPlayer())

	; always hold him on the ground to start
	; give "no fly" ability so it doesn't interfere with scripted "no fly"
	dragonActor.AddSpell(DLC2TameDragonNoFlyAbility)

	; start scene
	DLC2TameDragonScene2.Start()
endFunction

; check if dragon is in valid worldspace - if not, release immediately
function ValidateWorldspace()
; 	debug.trace(self + " ValidateWorldspace")
	if DLC2TameDragonAllowedWorldspaces.HasForm(Game.GetPlayer().GetWorldSpace()) == false
; 		debug.trace(self + " player in invalid worldspace " + Game.GetPlayer().GetWorldSpace() + " - release dragon")
		EndWait()
		ReleaseDragon()
	endif

endFunction

; call this when initial scene is ended or player tries to ride him
function EndWait()
; 	debug.trace(self + " EndWait")
	Actor dragonActor = dragonAlias.GetActorRef()

	; if he's not in a "waiting" state, do nothing
	if dragonActor.HasSpell(DLC2TameDragonNoFlyAbility) == false
; 		debug.trace(self + 	 " EndWait: not in waiting state, do nothing")
		return
	endif

	; can't restrain him again
	bAllowRestrain = false
	; unrestrain him
	RestrainDragon(false)
	; set crime faction
	dragonActor.SetCrimeFaction(DLC2TameDragonFaction)

	; let him fly if allowed
	dragonActor.RemoveSpell(DLC2TameDragonNoFlyAbility)
	dragonActor.RemoveSpell(DLC2abCalmDragon)

	; safety check: if dragon is not in aliases, must have been released (probably by player aggroing it)
	if dragonAlias.GetActorRef() != dragonActor
; 		debug.trace(" EndWait - dragonAlias doesn't match, do nothing else")
		return
	endif

	; set "done waiting" variable
	if dragonActor.GetActorValue("variable01") == 0
		dragonActor.SetActorValue("variable01", 1)
	endif

	dragonActor.EvaluatePackage()
	; register for summon duration (not for MQ06 dragon)
	if !bMQ06DragonTaming
		RegisterForSingleUpdateGameTime(fTameHours)
	endif

	; try adding the calm again in case it didn't work the first time
; 	debug.trace(self + " adding DLC2abCalmDragon to dragon")
	dragonActor.AddSpell(DLC2abCalmDragon)
	utility.wait(2)
	dragonActor.RemoveSpell(DLC2abCalmDragon)

	; if player is riding, increment riding variable
	if dragonActor.IsBeingRidden()
		if iDragonsRiddenCount == 0
			RegisterForSingleUpdate(8.0)
		endif
		; only increment if not already in tamed faction
		if !dragonActor.IsInFaction(DLC2TamedDragonTrackingFaction)
			dragonActor.AddToFaction(DLC2TamedDragonTrackingFaction)
			iDragonsRiddenCount = iDragonsRiddenCount + 1
			if iDragonsRiddenCount >= iDragonsRiddenAchievementCount
				Game.AddAchievement(73)
			endif
		endif
	endif
endFunction

; call this when timer runs out or dragon dies
function ReleaseDragon()
; 	debug.trace(self + " ReleaseDragon")
	; set actor value to indicate he wants to be released when possible
	Actor dragonActor = dragonAlias.GetActorRef()
	; don't do this more than once to the same dragon
	if dragonActor.GetActorValue("variable01") != 99
		dragonActor.SetActorValue("variable01", 99)
		; try to dispel now or later
		TryToReleaseDragon(dragonActor)
	endif
endFunction

event OnUpdateGameTime()
; 	debug.trace(self + " OnUpdate")
	; is dragon waiting to be released?
	Actor dragonActor = dragonAlias.GetActorRef()
	if dragonActor.GetActorValue("variable01") == 99
		TryToReleaseDragon(dragonActor)
	else
		; time to dispel
		ReleaseDragon()
	endif
endEvent

int tempCount = 0

function TryToReleaseDragon(actor dragonActor)
	tempCount += 1
; 	debug.trace(self + " TryToReleaseDragon " + tempCount)

	; if player is not riding, release
	if dragonActor.IsBeingRidden() == 0
		; RELEASE:
		dragonActor.SetRestrained(false)	 ; just in case
		dragonAlias.Clear()
		dragonReleasedAlias.ForceRefTo(dragonActor)
		; if in combat with player, release immediately
		if dragonActor.IsHostileToActor(Game.GetPlayer())
; 			debug.trace(self + " hostile to player, release immediately")
			FinishRelease()
		else
; 			debug.trace(self + " normal release, fly away before releasing")
			; move into "released" alias (no riding allowed)
			DLC2TameDragonReleaseScene.Start()
		endif
	else
		; player is riding - need him to land
		; FOR NOW - no time limit if player is riding
		; just keep checking for player to be not riding

;		dragonActor.SetAllowFlyingEx(false, false, true)

;		if dragonActor.GetFlyingState() == 0 && dragonActor.IsBeingRidden() == 1 && Game.GetPlayer().IsOnMount() == 1
			; force player to dismount
;			Game.GetPlayer().Dismount()
			; give time for dismount to finish
;			RegisterForSingleUpdateGameTime(0.1)
;		else
			RegisterForSingleUpdateGameTime(0.1)
;		endif
	endif
endFunction

; called when escape scene ends
function FinishRelease()
	actor dragonActor = dragonReleasedAlias.GetActorRef()
; 	debug.trace(" FinishRelease: dragon=" + dragonActor)
	; clear actor value
	dragonActor.SetActorValue("variable01", 0)
; 	debug.trace(self + " FinishRelease - variable01=" + dragonactor.GetActorValue("variable01"))
	; failsafe
	dragonActor.RemoveSpell(DLC2TameDragonNoFlyAbility)
	; clear aliases
	dragonAlias.Clear()
	dragonReleasedAlias.Clear()
	; not teammate any more
; 	debug.trace(self + " FinishRelease - dragon NOT teammate")
	dragonActor.SetPlayerTeammate(false)
	dragonActor.SetCrimeFaction(none)
	dragonActor.EvaluatePackage()
endFunction

function DragonDead()
	; called by OnDeath block on dragon
	; stop pending updates if any
	UnregisterForUpdateGameTime()
endFunction

function RestrainDragon(bool bRestrain)
	; this is to prevent him from responding to attacks when on the ground
	; only do this when not flying!
	actor dragonActor = dragonAlias.GetActorRef()
	if bRestrain && dragonActor.GetActorValue("variable01") != 99
		while dragonActor.GetFlyingState() > 0 && bAllowRestrain
			utility.wait(1.0)
		endwhile
; 		debug.trace(self + " ready to restrain dragon")
		; only restrain if the allow flag is still true
		if bAllowRestrain
; 			debug.trace(self + " restraining dragon")
			dragonActor.SetRestrained(true)
			; stop combat/alarms again to be sure
			dragonActor.StopCombatAlarm()
			; add calm ability - has to be AFTER restraining him
; 			debug.trace(self + " adding DLC2abCalmDragon to dragon")
			dragonActor.AddSpell(DLC2abCalmDragon)
		endif
		; TRY MAKING TEAMMATE here - do it even if restrain can't happen
		dragonActor.SetPlayerTeammate(true, false)
	else
; 		debug.trace(self + " UN-Restraining dragon")
		dragonActor.SetRestrained(false)
	endif
endFunction

; this is used only for displaying the first-time help message
bool bLearnMessageDisplayed = false
event OnUpdate()
	if !bLearnMessageDisplayed
		bLearnMessageDisplayed = true
		DLC2LearnDragonRidingMsg.Show()
	endif
endEvent


ReferenceAlias Property dragonAlias  Auto  
ReferenceAlias Property dragonReleasedAlias  Auto  

Scene Property DLC2TameDragonScene1  Auto  
{ normal tame scene to hold dragon on ground when you first tame him}

Scene Property DLC2TameDragonScene2 Auto  
{ tame scene to hold dragon on ground after already tamed, if hit by the spell again }

Scene Property DLC2MQ06TameDragonScene  Auto
{ MQ06 tame dragon scene }

Faction Property DLC2MQ06DragonFaction Auto
{ used to check for MQ06 dragon }

Quest Property DLC2MQ06 Auto

Float Property fTameHours = 1.0  Auto  Conditional
{duration of tame in game hours}

Scene Property DLC2TameDragonReleaseScene  Auto  

ObjectReference Property DLC2TameDragonOrbitMarker Auto
{ default object that the orbit package uses
  code also moves this to fast travel destination }

FormList Property DLC2TameDragonAllowedWorldspaces Auto
{ formlist of allowed worldspaces - dragon can only be tamed/ridden in these worldspaces }

bool bMQ06DragonTaming	; set to true when we've tamed the MQ06 dragon first time

SPELL Property DLC2TameDragonNoFlyAbility  Auto  

SPELL Property DLC2abCalmDragon  Auto  

Faction Property DLC2TameDragonFaction Auto

Message Property DLC2TameDragonResistMSG Auto

int Property iDragonsRiddenAchievementCount = 5 Auto
int iDragonsRiddenCount = 0

Message Property DLC2LearnDragonRidingMsg Auto

Faction Property DLC2TamedDragonTrackingFaction Auto
