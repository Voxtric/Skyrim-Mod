Scriptname DLC2MQ06MiraakSprintFXScript extends ActiveMagicEffect  

Event OnEffectStart(Actor akTarget, Actor akCaster)
; 	 Debug.Trace(self + ": SprintFX >ON<")
	akTarget.playSubgraphAnimation("startStreak")
endEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
; 	 Debug.Trace(self + ": SprintFX >OFF<")
	akTarget.playSubgraphAnimation("stopStreak")
endEvent

