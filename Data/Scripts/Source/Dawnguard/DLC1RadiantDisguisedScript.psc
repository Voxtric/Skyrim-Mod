Scriptname DLC1RadiantDisguisedScript extends Quest  

Faction Property DLC1RadiantDisguisedFollowPlayerFaction  Auto  

FavorDialogueScript Property DialogueFavorGeneric auto

bool PersuadeOnce
bool IntimidateOnce

Function Persuade(Actor akSpeaker)

	if PersuadeOnce == false
		PersuadeOnce = true
		DialogueFavorGeneric.Persuade(akSpeaker)
	endif

EndFunction

Function Intimidate(Actor akSpeaker)
	if IntimidateOnce == false
		IntimidateOnce = true
		DialogueFavorGeneric.Intimidate(akSpeaker)
	endif
EndFunction

Function AddFollowFactionToActor(Actor ActorToAddFactionTo)
	ActorToAddFactionTo.AddToFaction(DLC1RadiantDisguisedFollowPlayerFaction)
EndFunction