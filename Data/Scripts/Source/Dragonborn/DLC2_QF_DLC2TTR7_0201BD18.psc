;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_QF_DLC2TTR7_0201BD18 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Staff
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Staff Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkyrimMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkyrimMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DungeonMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DungeonMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Player has the staff

SetObjectiveCompleted(100, true)
SetObjectiveDisplayed(200, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Player gives the staff to Neloth

SetObjectiveCompleted(200, true)
game.GetPlayer().AddItem(DLC2LootStaffAllBest)
DLC2TTR7DoneOnce.SetValue(1)
game.GetPlayer().RemoveItem(Alias_Staff.GetRef(), 99)
AchievementsQuest.IncSideQuests()

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player has been asked to get a staff

SetObjectiveDisplayed(100, true)

alias_DungeonMapMarker.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property DLC2LootStaffAllBest  Auto  

GlobalVariable Property DLC2TTR7DoneOnce  Auto  
AchievementsScript Property AchievementsQuest Auto
