Scriptname DLC1RadiantOnDeathScript extends ReferenceAlias  

ReferenceAlias[] property AliasesToCheck auto
{When I die, check if everyone in this array is also dead, if so set stage}

int Property StageToSet auto
{what stage to set when everyone is dead}

Event OnDeath(Actor akKiller)
	bool everyoneDead = true

	int index = 0
	while (index < AliasesToCheck.Length)
		if AliasesToCheck[index].GetActorReference().IsDead() == false
			everyoneDead = false
		endif
		index += 1
	endwhile

	if everyoneDead
		GetOwningQuest().setStage(StageToSet)
	endif
	
EndEvent