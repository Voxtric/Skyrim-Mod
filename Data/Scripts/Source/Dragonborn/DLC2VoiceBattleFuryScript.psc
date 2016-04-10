Scriptname DLC2VoiceBattleFuryScript extends ActiveMagicEffect  

SPELL Property DLC2VoiceElementalFury  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
; 	debug.trace("BATTLE FURY: cast on " + akTarget)
	DLC2VoiceElementalFury.Cast(akTarget)
EndEvent