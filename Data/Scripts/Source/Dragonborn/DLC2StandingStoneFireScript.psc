Scriptname DLC2StandingStoneFireScript extends ActiveMagicEffect  

SPELL Property DLC2StandingStoneFireStorm  Auto  

Event OnEffectStart(actor akTarget, actor akCaster)
	akCaster.RemoveSpell(DLC2StandingStoneFireStorm)
EndEvent