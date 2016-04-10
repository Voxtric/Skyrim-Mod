;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname QF_DLC2ThirskFFHilund_02038FBB Extends Quest Hidden

;BEGIN ALIAS PROPERTY Hilund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hilund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
FailAllObjectives()
Stop()
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

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
CompleteAllObjectives()

; REWARD
Alias_Hilund.GetActorRef().MakePlayerFriend()
Game.GetPlayer().AddItem(LvlQuestReward02Medium)

; Stop() ; leave it running until the player shuts it down with a change location event
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property LvlQuestReward02Medium  Auto  
