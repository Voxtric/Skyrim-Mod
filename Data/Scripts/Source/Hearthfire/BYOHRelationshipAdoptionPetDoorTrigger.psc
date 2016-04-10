ScriptName BYOHRelationshipAdoptionPetDoorTrigger extends ObjectReference
{Script for a trigger outside each of the player houses. Pets or critters entering this trigger will be warped inside the home (since they can't use doors normally.}

Keyword property BYOHAdoptionHousepetKeyword Auto
Faction property CurrentFollowerFaction Auto
LocationAlias property CurrentHomeLocation Auto
ReferenceAlias property SandboxHome Auto


Event OnTrigger(ObjectReference triggerRef)
	;Is this a housepet? Is it trying to get back inside?
	if (triggerRef.HasKeyword(BYOHAdoptionHousepetKeyword) && !(triggerref as Actor).IsInFaction(CurrentFollowerFaction))
		;Is the player inside? If so, we'll wait so the pet doesn't teleport in in front of them.
		if (Game.GetPlayer().GetCurrentLocation() != CurrentHomeLocation.GetLocation())
			triggerRef.Disable(True)
			triggerRef.MoveTo(SandboxHome.GetReference())
			triggerRef.Enable(True)
		EndIf	
	EndIf
EndEvent