Scriptname DLC1dunHarkonSummonScript extends ActiveMagicEffect  
{Script on Harkon's Summon Gargoyle spell. This callback to the main battle script will prevent him from summoning another.}

ReferenceAlias property DLC1VQ08HarkonAlias Auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	;Debug.Trace("Gargoyle summoned. Call to recording.")
	(DLC1VQ08HarkonAlias as DLC1dunHarkonBossBattle).RecordSummonedGargoyle()
EndEvent
