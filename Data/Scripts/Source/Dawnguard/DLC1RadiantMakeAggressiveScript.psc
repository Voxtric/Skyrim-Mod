Scriptname DLC1RadiantMakeAggressiveScript extends ReferenceAlias  

ReferenceAlias[] property AliasesToMakeAggressive auto
{Make all these aliases aggressive when triggers occur}

int property AggressionLevel = 1 auto
{Default: 1; what value to set their aggression to}

bool property AggressiveOnHit auto
{Make all the aliases in the AliasesToMakeAggressive aggressive if anybody hits me with a weapon or projectile}

State Done
	Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
		;prevents spamming from concentration spells
		;Do not put ANYTHING in here, not even traces
	endEvent
EndState



Event OnHit(ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	
	GoToState("Done")

	int index = 0
	while (index < AliasesToMakeAggressive.Length)
		AliasesToMakeAggressive[index].GetActorReference().SetAv("Aggression", AggressionLevel)
		index += 1
	endwhile

endEvent