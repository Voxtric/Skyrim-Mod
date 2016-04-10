Scriptname DLC2PillarBuilderScript extends ReferenceAlias  
{Script attached to BuilderX aliases in DLC2Pillar quest. Used to make this person a builder at a later date.}

;usually anyone in the DLC2PillarBuilderFaction works on the pillar at night.
;usually they are in this faction from game start, howver if they need to get added to this at a later time, this script facilitates that.
;This script will put them in that faction at some later time, so they don't immediately go to building if it's night time at the moment when you want to flag them as being a builder.
;For example you want an introductory scene to a town, and don't want people to suddenly go build if the player sees the scene at night.

objectReference myPillarToggleLink 

Event OnUpdateGameTime()

	Actor actorRef = GetActorReference()
	Quest myOwningQuest = GetOwningQuest()

	if myPillarToggleLink.isDisabled()
;		Debug.Trace(self + "OnUpdateGameTime() myPillarToggleLink[ " + myPillarToggleLink +  "] is disabled. So will not call AddMetToBuilderFaction() " + actorRef)

	else
;		Debug.Trace(self + "OnUpdateGameTime() will call AddMeToBuilderFaction() for " + actorRef)
		(myOwningQuest as DLC2PillarScript).AddMeToBuilderFaction(actorRef)

	endif

;	Debug.Trace(self + "OnUpdateGameTime() will call ClearRefFrom() for " + actorRef)
	(myOwningQuest as DLC2ReferenceAliasArrayScript).ClearRefFrom(actorRef)

EndEvent

Function RegisterMeToBuild(int HoursDelayToMakeABuilder, objectReference pillarToggleLink)
; 	Debug.Trace(self + "RegisterMeToBuild() " + HoursDelayToMakeABuilder + ", " + pillarToggleLink)
	myPillarToggleLink = pillarToggleLink
	RegisterForSingleUpdateGameTime(HoursDelayToMakeABuilder)
EndFunction
