Scriptname DLC2EnchStaggerBallistaScript extends ActiveMagicEffect  

Message Property DLC2BallistaMsg  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	if akTarget == game.GetPlayer()
		DLC2BallistaMsg.Show()
	endif
EndEvent
