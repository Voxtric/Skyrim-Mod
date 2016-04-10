Scriptname DLC2TTR4bSpellEffectScript extends ActiveMagicEffect  

Float Property Delay  Auto  
Quest Property DLC2TTR4b  Auto  
ImageSpaceModifier Property FadeImod  Auto  
GlobalVariable Property DLC2NelothSpellExpire  Auto  

Event OnEffectStart(Actor akTarget, Actor akCaster)
	game.DisablePlayerControls()
	DLC2TTR4b.SetStage(110)
	FadeToBlackTransition.Apply()
	utility.wait(2)
	FadeToBlackTransition.PopTo(FadeImod)
	Utility.Wait(Delay)
	RegisterForUpdate(2)
EndEvent

Event OnUpdate()
	if DLC2NelothSpellExpire.GetValue() > 0
		FadeImod.Apply()
		Utility.Wait(Delay)
		game.EnablePlayerControls()
		Dispel()
	endif
EndEvent

Event OnEffectFinish(Actor akTarget, Actor akCaster)
	; safety net to restore player controls
	FadeImod.PopTo(FadeToNormal)
	Utility.Wait(Delay)
	game.EnablePlayerControls()
EndEvent

ImageSpaceModifier Property FadeToBlackTransition  Auto  

ImageSpaceModifier Property FadeToNormal  Auto  
