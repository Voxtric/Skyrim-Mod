Scriptname DLC1LD_AetherialShieldEffectScript extends ActiveMagicEffect
{Script for the DLC1LD Aetherial Shield Etherialize Effect. Forces the Actor to quickly reevaluate their package to prevent them from attacking the player.}

Event OnEffectStart(Actor Target, Actor Caster)
	Target.EvaluatePackage()
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	Target.EvaluatePackage()
EndEvent