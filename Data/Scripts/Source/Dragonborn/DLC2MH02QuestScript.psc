Scriptname DLC2MH02QuestScript extends Quest conditional


bool Property RieklingFG auto conditional
bool Property ChiefFGAtStart auto conditional
bool Property BilgemuckFollow auto conditional
bool Property Stage30ResumeShunt auto conditional

GlobalVariable Property NordsAlive auto
GlobalVariable Property NordsKilled auto
GlobalVariable Property NordsTotal auto

ReferenceAlias[] Property Rieklings auto

Function NordKilled()
	NordsAlive.Value -= 1
	ModObjectiveGlobal(1, NordsKilled, 35)

	if (NordsAlive.Value <= 0)	
		SetStage(37)
	endif
EndFunction


Function EVPAllRieklings()
	int count = 0
	while (count < Rieklings.length)
		Rieklings[count].GetActorReference().EvaluatePackage()
		count += 1
	endwhile
EndFunction

Function PostMQDealWith()
	
EndFunction
