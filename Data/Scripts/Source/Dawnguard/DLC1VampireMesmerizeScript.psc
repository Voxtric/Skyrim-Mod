Scriptname DLC1VampireMesmerizeScript extends ActiveMagicEffect  
{Attached to DLC1VampireMesmerize Magic Effect.}

MagicEffect Property InfluenceAggDownFFAimed auto
MagicEffect Property PerkMasterMindAggDownFFAimed auto

DLC1ReferenceAliasArrayScript Property DLC1VampireMesmerize auto

faction Property DLC1VampireFeedNoCrimeFaction auto

bool DoneStarting

EVENT OnEffectStart(Actor Target, Actor Caster)

	Target.addToFaction(DLC1VampireFeedNoCrimeFaction)
	
	utility.wait(1) ;give the other effets on the spell a chance to be resisted

	if Target.HasMagicEffect(InfluenceAggDownFFAimed) || Target.HasMagicEffect(PerkMasterMindAggDownFFAimed)
		debug.trace(Self + "OnEffectStart() calling ForceRefInto(" + Target + ") on " + DLC1VampireMesmerize)

		DLC1VampireMesmerize.ForceRefInto(Target)

	else
		Dispel()

	endif

	DoneStarting = true

endEVENT

EVENT OnEffectFinish(Actor Target, Actor Caster)

	while DoneStarting == false
		utility.wait(1)
	endwhile

	Target.removeFromFaction(DLC1VampireFeedNoCrimeFaction)

	debug.trace(Self + "OnEffectFinish() calling ClearRefFrom(" + Target + ") on " + DLC1VampireMesmerize)
	DLC1VampireMesmerize.ClearRefFrom(Target)

endEVENT
