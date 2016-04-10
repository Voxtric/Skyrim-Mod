Scriptname DLC2PillarScript extends Quest  

faction Property DLC2PillarBuilderFaction auto

keyword property DLC2LinkPillarToggle auto  ;used for link ref from actors to toggle

globalvariable Property DLC2PillarChantNum auto

DLC2PillarPlayerScript Property Player auto

faction Property dunPrisonerFaction auto

package Property DLC2SleepBuild auto



function MakeMeABuilder(Actor ActorToMakeABuilder, int HoursDelayToMakeABuilder = 4)
; 	Debug.Trace(self + "MakeMeAPillarBuilder()" + ActorToMakeABuilder + ", " + HoursDelayToMakeABuilder)

	DLC2ReferenceAliasArrayScript selfAsAliasArrayScript = (Self as Quest) as DLC2ReferenceAliasArrayScript

	DLC2PillarBuilderScript BuilderAlias = selfAsAliasArrayScript.ForceRefToAndReturnAlias(ActorToMakeABuilder) as DLC2PillarBuilderScript

	ObjectReference pillarToggleLink = ActorToMakeABuilder.GetLinkedRef(DLC2LinkPillarToggle)

; 	Debug.Trace(self + "MakeMeAPillarBuilder() will call RegisterMeToBuild() on alias:" + BuilderAlias + ", DLC2LinkPillarToggle linkedRef: " + pillarToggleLink)

	BuilderAlias.RegisterMeToBuild(HoursDelayToMakeABuilder, pillarToggleLink)

endFunction

Function AddMeToBuilderFaction(Actor ActorToAddToFaction); called by DLC2PillarBuilderScript
;	Debug.Trace(self + "AddMeToBuilderFaction()" + ActorToAddToFaction)
	ActorToAddToFaction.AddToFaction(DLC2PillarBuilderFaction)

EndFunction

Function CheckMyPillarToggle(Actor ActorToCheck)
	ObjectReference myPillarToggleLink = ActorToCheck.GetLinkedRef(DLC2LinkPillarToggle)

;	Debug.Trace(self + "CheckMyPillarToggle()" + ActorToCheck)

	if myPillarToggleLink == NONE
; 		Debug.Trace(self + "CheckMyPillarToggle() ERROR: myPillarToggleLink == NONE, so bailing out early with RETURN "  + ActorToCheck, 2)
		RETURN

	else
		if myPillarToggleLink.IsDisabled()
;			Debug.Trace(self + "CheckMyPillarToggle() myPillarToggleLink isDisabled() == true, so REMOVING me from DLC2PillarBuilderFaction faction. "  + ActorToCheck)
			ActorToCheck.RemoveFromFaction(DLC2PillarBuilderFaction)

		else
;			Debug.Trace(self + "CheckMyPillarToggle() myPillarToggleLink isDisabled() == false, so NOT removing me from DLC2PillarBuilderFaction faction. "  + ActorToCheck)

		endif

	endif
EndFunction

function CueUpNextSpeakerAndLine()
;	Debug.Trace(self + "CueUpNextSpeakerAndLine()")

	IncrementLine()
	
	;call function on player alias
	Player.CheckLocationAndRegisterForUpdate()

endFunction

function IncrementLine()
	int lineCount = 16

	;increase the value used as condition on lines
	int chantNum = DLC2PillarChantNum.GetValue() as int

	if chantNum == lineCount - 1
		DLC2PillarChantNum.setValue(0)  ;first line is conditioned on the DLC2PillarChantNum being 0
	else
		DLC2PillarChantNum.setValue(chantNum + 1) ; increase the DLC2PillarChantNum value
	endif
endFunction

Function SetBuilderFactionFriendliness(Actor ActorToSet, bool IsSleepBuildTemplate = false)

	bool IsInBuilderFaction = ActorToSet.IsInFaction(DLC2PillarBuilderFaction)

;	Debug.Trace(self + "SetBuilderFactionFriendliness() Actor to set:" + ActorToSet + ", IsSleepBuildTemplate:" + IsSleepBuildTemplate + ", IsInBuilderFaction:" + IsInBuilderFaction)
	if IsSleepBuildTemplate && IsInBuilderFaction
;		Debug.Trace(self + "SetBuilderFactionFriendliness() adding actor to dunPrisonerFaction" + ActorToSet)
		ActorToSet.AddToFaction(dunPrisonerFaction)
	else
;		Debug.Trace(self + "SetBuilderFactionFriendliness() removing actor from dunPrisonerFaction" + ActorToSet)
		ActorToSet.RemoveFromFaction(dunPrisonerFaction)
	endif
	
EndFunction

Event OnSleepStart(float afSleepStartTime, float afDesiredSleepEndTime)
; 	debug.trace(self + "OnSleepStart")
	Actor playerActor = Game.GetPlayer()
	Location playerLocation = playerActor.GetCurrentLocation()
	; only on Solstheim, and only until MQ03B is done
	if DLC2MQ03B.IsCompleted() == false && playerActor.IsInLocation(DLC2SolstheimLocation) && DBEntranceQuest.pSleepyTime != 1
		; must be a valid location - exterior or dwelling
		if playerLocation.HasKeyword(LocTypeDwelling) || playerActor.GetWorldspace() == DLC2SolstheimWorld
			if Utility.RandomInt(1, 100) <= ChanceToWorkOnPillar
				; change chance to normal
				ChanceToWorkOnPillar = ChanceNormal
				; pick a stone
				int stone = Utility.RandomInt(0, StandingStones.Length - 1)
; 				debug.trace(self + " picking stone " + stone + "=" + StandingStones[stone])
				; activate it only if not freed
				if StandingStones[stone].Freed == false
					StandingStones[stone].WorkOnPillar()
				endif
			endif
		endif
	endif
EndEvent

DLC2StandingStoneScript[] Property StandingStones  Auto  
{array of standing stones to move player to during sleep}

int Property ChanceToWorkOnPillar = 100 Auto
{ percent chance to work on pillar each time you sleep}

int Property ChanceNormal = 33 Auto
{ after first time, change to this chance}

Location Property DLC2SolstheimLocation Auto

Quest Property DLC2MQ03B Auto

Keyword Property LocTypeDwelling  Auto  

Worldspace Property DLC2SolstheimWorld Auto

pDBEntranceQuestScript Property DBEntranceQuest Auto
