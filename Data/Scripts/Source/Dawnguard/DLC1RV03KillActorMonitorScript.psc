Scriptname DLC1RV03KillActorMonitorScript extends Quest  
{Script attached to DLC1RV03KillActorMonitor Quest}

DLC1RadiantScript Property DLC1Radiant auto
Quest Property DLC1RV03 auto
ReferenceAlias Property DLC1RV03Victim auto

keyword Property DLC1RV03HunterGarb auto

Event OnStoryKillActor(ObjectReference akVictim, ObjectReference akKiller, Location akLocation, int aiCrimeStatus, int aiRelationshipRank)
 	;sets stages in "parent" quest, and forces reference in parent quest

 	Debug.Trace(self + "Event OnStoryKillActor() akVictim = " + akVictim)

 	int CrimeReportedAndDisguised
 	int HighProfileTarget

	if (aiCrimeStatus == 2)
		Debug.Trace(self + "Crime WAS Reported")
		CrimeReportedAndDisguised = 10
	else
		Debug.Trace(self + "Crime NOT Reported")
		CrimeReportedAndDisguised = 0
	endif

	if DLC1Radiant.IsHighProfileTarget(akVictim)
		Debug.Trace(self + "IS high profile target")
		HighProfileTarget = 1
	else
		Debug.Trace(self + "is NOT high profile target")
		HighProfileTarget = 0
	endif

	if (Game.GetPlayer().WornHasKeyword(DLC1RV03HunterGarb) == False)	
		Debug.Trace(self + "is NOT wearing hunter armor")
		CrimeReportedAndDisguised = 0
	endif

	;Quest stages use tens and ones places as bool switches
	;100 = killed someone, crime not reported, not high profile vicim
	;101 = killed someone, crime not reported, high profile victim
	;110 = killed somone, crime reported, not high profile victim
	;111 = killed somone, crime reported, high profile victim

	DLC1RV03Victim.ForceRefTo(akVictim)
	DLC1RV03.SetStage(100 + CrimeReportedAndDisguised + HighProfileTarget)
	Stop()

EndEvent
