;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC1_QF_DLC1VQ05SoulGemHandle_0100EA41 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC1VQ05GemAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05GemAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05GemChestAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05GemChestAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Picked up the Soul Gem - Remove it and the Spell off of the Player
if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
Game.GetPlayer().RemoveSpell(pDLC1VQSoulDamage)
Game.GetPlayer().RemoveItem(Alias_DLC1VQ05GemAlias.GetRef())
Game.GetPlayer().AddItem(pSoulGemBlack,1)
;pDLC1VQ04SoulTrapped.SetValue(0)

;Need FX here

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Valerica just told Player about the Gem
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;This activates the moment the Player is Soul Trapped
;This is in case Player blunders across gem before Valerica talks about it
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Done - Shutdown
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property pDLC1VQSoulDamage  Auto  

SoulGem Property pSoulGemBlack  Auto  

GlobalVariable Property pDLC1VQ04SoulTrapped  Auto  
