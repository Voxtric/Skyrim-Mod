;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC2_QF_DLC2TTR4b_0201CDE1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Talvas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Talvas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; spell has been cast

DLC2TTR4bScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Game.EnablePlayerControls()
game.SetInChargen( false, false, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; Player rejects quest

DLC2TT4bRun.SetValue(1)

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Quest ends

game.GetPlayer().AddItem(Gold, 250)
SetObjectiveCompleted(150, true)
;AchievementsQuest.IncSideQuests()
DLC2TT4bRun.SetValue(1)

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player agrees to be test subject

game.DisablePlayerControls()
game.SetInChargen( true, true, false)
SetObjectiveDisplayed(150, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

Scene Property DLC2TTR4bScene  Auto  

GlobalVariable Property DLC2TT4bRun  Auto  
AchievementsScript Property AchievementsQuest Auto
