;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname QF_DLC2ThirskFFElmus_02038EBF Extends Quest Hidden

;BEGIN ALIAS PROPERTY Elmus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Elmus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThirskDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThirskDoor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
FailAllObjectives()
Done.Value = 1
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
CompleteAllObjectives()

; REWARD
Alias_Elmus.GetActorRef().MakePlayerFriend()
AshfireChanceNone.Value = 0
Game.GetPlayer().AddItem(LvlQuestReward02Medium)

Done.Value = 1
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; silent shutdown

SetObjectiveDisplayed(10, 0)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property Done  Auto  

GlobalVariable Property AshfireChanceNone  Auto  

LeveledItem Property LvlQuestReward02Medium  Auto  
