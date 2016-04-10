;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_DLC2ThirskFFHalbarn_02038FBC Extends Quest Hidden

;BEGIN ALIAS PROPERTY Halbarn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Halbarn Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
CompleteAllObjectives()

; REWARD
Alias_Halbarn.GetActorRef().MakePlayerFriend()
Game.GetPlayer().AddItem(LvlQuestReward02Medium)
DLC2ThirskHalbarnLootChanceNone.Value = 0

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property LvlQuestReward02Medium  Auto  

GlobalVariable Property DLC2ThirskHalbarnLootChanceNone  Auto  
