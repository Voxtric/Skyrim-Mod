Scriptname DLC2OverwhelmEffectScript extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	akTarget.EnableAI(false)
	akTarget.SetGhost(true)
	akTarget.BlockActivation(true)
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	akTarget.EnableAI(true)
	akTarget.SetGhost(false)
	akTarget.BlockActivation(false)
EndEvent

Keyword Property ActorTypeCreature  Auto  
