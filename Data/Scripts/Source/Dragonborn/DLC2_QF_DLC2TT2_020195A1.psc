;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname DLC2_QF_DLC2TT2_020195A1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY HighpointTowerExteriorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HighpointTowerExteriorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ildari
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ildari Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DungeonLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DungeonLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NelothsRing
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NelothsRing Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HeartStone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HeartStone Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Niyya
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Niyya Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; quick start

DLC2Init.SetStage(100)
DLC2MQ01.SetStage(200)
DLC2TT1.SetStage(100)
DLC2TT1.SetStage(500)
DLC2TTR5.SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; past the blocking topic that send PC to Highpoint
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; Player has reported back to Neloth

Game.GetPlayer().Removeitem(Alias_NelothsRing.GetRef())
Game.GetPlayer().Removeitem(Alias_HeartStone.GetRef())

DLC2TT2CastDivination.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Neloth gives the player the ring of detection

SetObjectiveDisplayed(100, true)

Alias_HeartStone.GetRef().Enable()
Game.GetPlayer().Additem(Alias_NelothsRing.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Player has the heart stone

SetObjectiveCompleted(100, true)
SetObjectiveDisplayed(200, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Neloth sends the player out to kill Ildari

SetObjectiveCompleted(200, true)
SetObjectiveDisplayed(400, true)

Alias_MapMarker.GetRef().AddToMap()
;disable marker outside dungeon which was blocking the doorway
Alias_HighpointTowerExteriorMarker.GetRef().disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Player was forcegreeted. Used to make sure Forcegreet only happens once.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; Ildari is dead

SetObjectiveCompleted(400, true)
SetObjectiveDisplayed(500, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; start up
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; No longer in use
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; player talks to Neloth and gets reward

SetObjectiveCompleted(500, true)
Game.GetPlayer().AddItem(LootStaffsAll, 1)

AchievementsQuest.IncSideQuests()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property DLC2EnchLlunelasRing  Auto  

Scene Property DLC2TT2CastDivination  Auto  

SPELL Property DLC2Fling  Auto  

LeveledItem Property LootStaffsAll  Auto  

Quest Property DLC2TT1  Auto  

Quest Property DLC2TTR5  Auto  

Quest Property DLC2Init  Auto  

Quest Property DLC2MQ01  Auto  

AchievementsScript Property AchievementsQuest Auto
