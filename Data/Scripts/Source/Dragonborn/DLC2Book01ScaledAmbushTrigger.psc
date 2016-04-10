ScriptName DLC2Book01ScaledAmbushTrigger extends objectReference
{Default script that simply activates itself when player enters trigger}

import game
import debug

bool property doOnce = TRUE auto
{Fire only once?  Default: TRUE}
bool property disableWhenDone = FALSE auto
{Disable after activating? Default: FALSE}
bool property playerOnly = TRUE auto
{Only Player Triggers?  Default: TRUE}
bool property playerAndAlliesOnly = False Auto
{Only player or Allies/Followers/Summons trigger? Overrides playerOnly if that's true as well.  Default: TRUE}
int property minLevel auto
{Optional: If set, player must be >= minLevel to activate this}

Faction property PlayerFaction Auto
Faction property CurrentFollowerFaction Auto
Package property Follow Auto
Package property FollowerPackageTemplate Auto

objectReference property controllerRef auto
DLC2Book01DungeonGenDeathTrackerParent property controllerScript auto hidden
int property newTotalDeaths = 5 auto hidden

ObjectReference property AmbushActor01 auto
ObjectReference property AmbushActor02 auto
ObjectReference property AmbushActor03 auto
ObjectReference property AmbushActor04 auto
ObjectReference property AmbushActor05 auto
int property ActorThreshold2 = 30 auto
int property ActorThreshold3 = 40 auto
int property ActorThreshold4 = 50 auto
int property ActorThreshold5 = 60 auto

;************************************

auto State waiting
	Event onTriggerEnter(objectReference triggerRef)
		Actor actorRef = triggerRef as Actor
		; check whether we care if the player is activating
		if(actorRef == game.getPlayer() || (playerAndAlliesOnly && IsPlayerAlly(triggerRef)) || (playerOnly == False && playerAndAlliesOnly == False))
			; also check level (if we even care about that)
			if(minLevel == 0 || game.getPlayer().getLevel() >= minLevel)
				if doOnce == TRUE
					gotoState("allDone")
				endif
				if disableWhenDone
					Self.Disable()
				EndIf
				; per the description of this script, pass self as the activating ref
				ScaleEncounter()
				;UpdateTotalDeaths()
				activate(self)
			endif
		endif
	endEvent
endState

bool Function IsPlayerAlly(ObjectReference triggerObj)
	Actor triggerAct = (triggerObj as Actor)
	
	;Short-circuit this if this isn't an Actor at all, or if it's hostile to the player.
	if (triggerAct == None || triggerAct.GetFactionReaction(GetPlayer()) == 1)
		return False
	EndIf
	
	;Is this a summon or one of the various types of player followers?
	return ((triggerAct.IsCommandedActor()) || \
			(triggerAct.GetRelationshipRank(GetPlayer()) > 0) || \
			(triggerAct.IsInFaction(CurrentFollowerFaction)) || \
			(triggerAct.IsPlayerTeammate()) || \
			(triggerAct.GetCurrentPackage().GetTemplate() == Follow) || \
			(triggerAct.GetCurrentPackage().GetTemplate() == FollowerPackageTemplate))
EndFunction

;************************************

State allDone
	;do nothing
endState

;************************************


Function UpdateTotalDeaths()
; 	debug.Trace(self + " telling controller to update total deaths needed")
	controllerScript = (controllerRef as DLC2Book01DungeonGenDeathTrackerParent)
	if controllerScript
		controllerScript.ChangeTotalDeathsNeeded(newTotalDeaths)
	else
; 		debug.Trace(self + ": BADNESS! controllerScript = " + controllerScript)
	endif
endFunction

Function ScaleEncounter()
	int playerLevel = game.getPlayer().getLevel()
	if playerLevel < ActorThreshold5
		AmbushActor05.disable()
		newTotalDeaths = 4
	endif
	if playerLevel < ActorThreshold4
		AmbushActor04.disable()
		newTotalDeaths = 3
	endif
	if playerLevel < ActorThreshold3
		AmbushActor03.disable()
		newTotalDeaths = 2
	endif
	if playerLevel < ActorThreshold2
		AmbushActor02.disable()
		newTotalDeaths = 1
	endif
endFunction