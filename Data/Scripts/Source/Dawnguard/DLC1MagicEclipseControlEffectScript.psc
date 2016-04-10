Scriptname DLC1MagicEclipseControlEffectScript extends ActiveMagicEffect  
{This will set the global value DLC1EclipseActive for the eclipse effects.}


GlobalVariable Property DLC1EclipseActive  Auto  

Event OnEffectFinish(Actor Target, Actor Caster)
	DLC1EclipseActive.SetValue(0.0)
EndEvent

