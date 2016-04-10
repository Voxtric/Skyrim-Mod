Scriptname DLC2WEScript extends WEScript  Conditional
{Extended WEScript for new functionality}

ReferenceAlias[] Property AggressionSetAliasArray auto
{Set the aggressiveness on these aliases}

int Property AggressionSetInitialValue = 0 auto
{Default: 0 [set to -1 if you don't want to change their aggression], What aggression to set on the actors in aliases in AggressionSetAliasArray}

bool Property AggressionSetAddToPlayerEnemyFaction = true auto
{Default: true, when making actors in aliases in AggressionSetAliasArray aggressive, add them to the WEPlayerEnemy faction}

Event OnStoryScript(Keyword akKeyword, Location akLocation, ObjectReference akRef1, ObjectReference akRef2, int aiValue1, int aiValue2)
	if AggressionSetInitialValue != -1 && AggressionSetAliasArray.length > 0
		InitializeAggressionSetAliases()
	endif

EndEvent

Function InitializeAggressionSetAliases()
; 	debug.trace(self + "InitializeAggressionSetAliases()")
	int i = 0
	actor CurActor = none
	while (i < AggressionSetAliasArray.length)
		CurActor = AggressionSetAliasArray[i].GetActorReference()
; 		debug.trace(self + "InitializeAggressionSetAliases() setting aggression:" + CurActor + ", aggression: " + AggressionSetInitialValue)
		CurActor.SetActorValue("Aggression", AggressionSetInitialValue)
		i += 1
	endwhile

EndFunction

Function MakeAliasesAggressive(int NewAggression = 1)
	int i = 0
	actor CurActor = none
	while (i < AggressionSetAliasArray.length)
		CurActor = AggressionSetAliasArray[i].GetActorReference()
		CurActor.SetActorValue("Aggression", NewAggression)
; 		debug.trace(self + "MakeAliasesAggressive() setting aggression:" + CurActor + ", aggression: " + NewAggression)
		if AggressionSetAddToPlayerEnemyFaction
; 			debug.trace(self + "MakeAliasesAggressive() adding to WEPlayerEnemy faction:" + CurActor)
			CurActor.AddToFaction(WEParentS.WEPlayerEnemy)
		endif
		i += 1
	endwhile
	
EndFunction