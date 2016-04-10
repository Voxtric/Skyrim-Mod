Scriptname BYOHHouseBanditAttackPacifyOnLoad extends ReferenceAlias  
{used to start bandit pacifier quest onLoad}

bool bDone ; set to true when event sent

event OnLoad()
	debug.trace(self + "OnLoad")
	if GetActorRef().GetCurrentLocation() == BanditDungeonLocation.GetLocation() && !bDone
		if (RequiredStage == -1 || GetOwningQuest().GetStageDone(RequiredStage)) && (DisableStage == -1 || GetOwningQuest().GetStageDone(DisableStage) == false)
			debug.trace(self + "OnLoad: sending pacifier event - aggression to 1")
			bDone = true
			BYOHHouseBanditPacifierKeyword.SendStoryEvent(BanditDungeonLocation.GetLocation(), None, None, 1)
		endif
	endif
endEvent

Keyword Property BYOHHouseBanditPacifierKeyword  Auto  
LocationAlias Property BanditDungeonLocation Auto
int Property RequiredStage = -1 Auto
{ only pacify if this stage is set }
int Property DisableStage = -1 Auto
{ if this stage is set, don't pacify }