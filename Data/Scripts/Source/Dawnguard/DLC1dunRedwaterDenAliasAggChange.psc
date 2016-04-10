ScriptName DLC1dunRedwaterDenAliasAggChange extends referenceAlias
{This script changes the aggession of the actor it is attached to on init when between specific quests stages}

int property lowerStage = 0 auto
int property upperStage = -1 auto
int property AggressionLevel auto
{sets the aggression
	0 = Unaggressive
	1 = Aggressive
	2 = Very Aggressive
	3 = Frenzied}
;bool property doOnce auto
	
event onCellAttach()
	debug.Trace(self + ": has fired onInit")
	;if !doOnce
		;doOnce == True
		int currentStage = getOwningQuest().getStage()
		if currentStage >= lowerStage
			if currentStage < upperStage || upperStage == -1
				debug.Trace(self + ": changing Aggression to >> " + AggressionLevel)
				(self.getActorReference()).setAV("Aggression", AggressionLevel)
			endif
		endif
	;endif
endEvent
