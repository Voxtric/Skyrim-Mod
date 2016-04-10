Scriptname DLC2ApoWaterSetGlobalMEScript extends ActiveMagicEffect  

GlobalVariable property DLC2IsInApocryphaWater auto

Event OnEffectStart(Actor akTarget, Actor akCaster)
	DLC2IsInApocryphaWater.setValue(1)
endEvent



Event OnEffectFinish(Actor akTarget, Actor akCaster)
	DLC2IsInApocryphaWater.setValue(0)
endEvent