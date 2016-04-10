;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_QF_DLC2TTR2_0201C06E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HeartStoneMine
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HeartStoneMine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HeartStoneVein
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HeartStoneVein Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MineMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MineMapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player gives a heart stone to Neloth

SetObjectiveCompleted(200, true)

game.GetPlayer().RemoveItem(DLC2HeartStone, 1)
game.GetPlayer().AddItem(Gold, 250)

AchievementsQuest.IncSideQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Player gets quest

SetObjectiveDisplayed(100, true)

Alias_Player.AddInventoryEventFilter(DLC2HeartStone)

alias_MineMapMarker.GetRef().AddToMap()

if game.GetPlayer().GetItemCount(DLC2HeartStone) >= 1
    SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; player gets a heart stone

SetObjectiveCompleted(100, true)
SetObjectiveDisplayed(200, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

MiscObject Property DLC2HeartStone  Auto  

AchievementsScript Property AchievementsQuest Auto
