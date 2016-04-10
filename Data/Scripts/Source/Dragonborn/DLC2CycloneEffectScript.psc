Scriptname DLC2CycloneEffectScript extends ActiveMagicEffect  

Int Property force  Auto  
Keyword Property ImmuneParalysis  Auto  

Event OnEffectStart(Actor Target, Actor Caster)
	if Target.HasKeyword(ImmuneParalysis) == false && force > 0
		Target.PushActorAway(Target, Force)
	endif
EndEvent


