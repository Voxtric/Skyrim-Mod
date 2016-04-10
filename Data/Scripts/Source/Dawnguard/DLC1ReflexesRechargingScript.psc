Scriptname DLC1ReflexesRechargingScript extends ActiveMagicEffect  

Event OnEffectFinish(Actor Target, Actor Caster) 
	DLC1ReflexesWaitMessage.Show()
EndEvent

Message Property DLC1ReflexesWaitMessage  Auto  
