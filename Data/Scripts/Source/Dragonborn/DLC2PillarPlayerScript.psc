Scriptname DLC2PillarPlayerScript extends ReferenceAlias  
{Script attached to Player alias in DLC2Pillar quest. Handles getting people building pillars to say their chant.}

keyword Property DLC2LocTypePillar auto
topic Property DLC2PillarBlockingTopic auto	

faction Property DLC2PillarBuilderFaction auto

float findRadius = 1500.0

Event OnUpdate()
;	Debug.Trace(self + "OnUpdate() will call CheckLocationAndRegisterForUpdate")
	FindActorAndSayLine()

	CheckLocationAndRegisterForUpdate()
EndEvent


Event OnLocationChange(Location akOldLoc, Location akNewLoc)
;	Debug.Trace(self + "OnLocationChange() will call CheckLocation akOldLoc: " + akOldLoc + ", akNewLoc:" + akNewLoc)
	CheckLocationAndRegisterForUpdate()

EndEvent

Function CheckLocationAndRegisterForUpdate(Location locToCheck = None)
	if locToCheck == None
		locToCheck = Game.GetPlayer().GetCurrentLocation()
	endif

	if locToCheck.HasKeyword(DLC2LocTypePillar)
;		Debug.Trace(self + "CheckLocationAndRegisterForUpdate() registering for single update because locToCheck has keyword DLC2LocTypePillar: " + locToCheck)
		RegisterForSingleUpdate(5)
	else
;		Debug.Trace(self + "CheckLocationAndRegisterForUpdate() NOT registering for update because locToCheck does not have keyword DLC2LocTypePillar: " + locToCheck)

	endif

EndFunction

Function FindActorAndSayLine()
;	Debug.Trace(self + "FindActorAndSayLine()")

	float timeStart = Utility.GetCurrentRealTime()
	
	Actor ActorRef = Game.FindRandomActorFromRef(Game.GetPlayer(), findRadius)
	
	float timeEnd = Utility.GetCurrentRealTime()
	float timeTaken = timeEnd - timeStart

;	Debug.Trace(self + "FindActorAndSayLine() took " + timeTaken + " seconds, found: " + ActorRef)
	
	if actorRef.IsInFaction(DLC2PillarBuilderFaction)
;		Debug.Trace(self + "FindActorAndSayLine will call say(DLC2PillarBlockingTopic) for actor")
		actorRef.say(DLC2PillarBlockingTopic)
	else
;		Debug.Trace(self + "FindActorAndSayLine not calling Say() because actor not in DLC2PillarBuilderFaction")
	endif


EndFunction