Scriptname DLC2WhirlwindDamageScript extends ActiveMagicEffect  

Int Property force  Auto  

Event OnEffectStart(Actor Target, Actor Caster)
		Caster.PushActorAway(Target, Force)
EndEvent

