Scriptname DLC2TTR4aDamageHealthScript extends ActiveMagicEffect  

GlobalVariable Property DLC2TTR4aWet  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	DLC2TTR4aWet.SetValue(1)
	DLC2TTR4a.SetStage(200)
EndEvent

Quest Property DLC2TTR4a  Auto  
