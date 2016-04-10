Scriptname DLC1RadiantCrimeMonitorScript extends Quest  
{Script attached to quests that start on Assault or Kill events.
The quest should NOT be conditionalized in the story manager to only fire on crime. 
This script will communicate to the "parent" quest if it was a crime or not by what stage it sets.
Note: you will need to add this to both an assualt, and kill quest if you are interested in either or both
THIS SCRIPT ASSUMES THAT THE STORY MANAGER IS HANDLING STARTING THE QUEST ONLY IF THE VICTIM IS SOMEONE THE PARENT QUEST CARES ABOUT!
}

quest Property ParentQuest auto
{Which other quest should this script set stages on?}

int Property StageKillNoCrime auto
{Which non-zero stage to set in ParentQuest when this quest notices a kill event that is NOT crime}

int Property StageKillCrime auto
{Which non-zero stage to set in ParentQuest when this quest notices a kill event that IS a crime}

int Property StageAssaultNoCrime auto
{Which non-zero stage to set in ParentQuest when this quest notices an assault event that is NOT crime}

int Property StageAssaultCrime auto
{Which non-zero stage to set in ParentQuest when this quest notices a assault event that IS a crime}

bool Property ShutDownImmediately = true auto
{Default: True; should this quest shut down as soon as it sets the stage on the parent quest?}

race Property DLC1VampireBeastRace auto
{If set to DLC1VampireBeastRace, if the player is a vampire lord when the kill event goes through, it will be treated as a crime}

Event OnStoryAssaultActor(ObjectReference akVictim, ObjectReference akAttacker, Location akLocation, int aiCrime)
	;THIS ASSUMES THAT THE STORY MANAGER IS HANDLING STARTING THE QUEST ONLY IF THE VICTIM IS SOMEONE THE PARENT QUEST CARES ABOUT!

	Debug.Trace(self + "OnStoryAssaultActor() aiCrime:" + aiCrime)

	if aiCrime && StageAssaultCrime
		ParentQuest.SetStage(StageAssaultCrime)

	elseif StageAssaultNoCrime
		ParentQuest.SetStage(StageAssaultNoCrime)

	endif

	if ShutDownImmediately
		Stop()
	endif
EndEvent

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, int aiRelationshipRank)
	;THIS ASSUMES THAT THE STORY MANAGER IS HANDLING STARTING THE QUEST ONLY IF THE VICTIM IS SOMEONE THE PARENT QUEST CARES ABOUT!

	Debug.Trace(self + "OnStoryKillActor() aiCrimeStatus:" + aiCrimeStatus)

	Race PlayerRace = Game.GetPlayer().GetRace()

	Debug.Trace(self + "OnStoryKillActor() Player Race:" + PlayerRace)

	if aiCrimeStatus == 2 || (DLC1VampireBeastRace && PlayerRace == DLC1VampireBeastRace) && StageKillCrime
		ParentQuest.SetStage(StageKillCrime)

	elseif StageKillNoCrime
		ParentQuest.SetStage(StageKillNoCrime)

	endif

	if ShutDownImmediately
		Stop()
	endif
EndEvent