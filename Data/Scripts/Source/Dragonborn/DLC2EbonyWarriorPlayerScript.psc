Scriptname DLC2EbonyWarriorPlayerScript extends ReferenceAlias  

Quest Property DLC2EbonyWarriorQuest  Auto  
ReferenceAlias Property EbonyWarrior  Auto  
ReferenceAlias Property LastVigil  Auto  
Location Property DLC2LastVigilLocation  Auto  
Faction Property CrimeFactionWhiterun  Auto  

bool OnlyOnce

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	if OnlyOnce == false
		if DLC2EbonyWarriorQuest.GetStage() == 100
			OnlyOnce = true
			EbonyWarrior.GetRef().MoveTo(LastVigil.GetRef())
			EbonyWarrior.GetActorRef().SetCrimeFaction(none)
			EbonyWarrior.GetActorRef().RemoveFromFaction(CrimeFactionWhiterun)
		endif
	endif

	if akNewLoc == DLC2LastVigilLocation && OnlyOnce == true
		GetActorRef().StartCombat(game.GetPlayer())
	endif
EndEvent

