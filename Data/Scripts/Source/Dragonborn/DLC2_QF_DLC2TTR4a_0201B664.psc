;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC2_QF_DLC2TTR4a_0201B664 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player discovers the side effect

SetObjectiveCompleted(100, true)
SetObjectiveDisplayed(200, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Neloth casts spell on player

SetObjectiveDisplayed(100, true)

game.GetPlayer().AddSpell(DLC2TTR4aFortifyHealth, false)
game.GetPlayer().AddSpell(DLC2CheckWater, false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; player reports back to Neloth

SetObjectiveCompleted(200, true)
game.GetPlayer().RemoveSpell(DLC2TTR4aFortifyHealth)
game.GetPlayer().RemoveSpell(DLC2CheckWater)
game.GetPlayer().AddItem(Gold, 250)
DLC2TT4aRun.SetValue(1)

AchievementsQuest.IncSideQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; player declines the quest

SetObjectiveFailed(200, true)
DLC2TT4aRun.SetValue(1)

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property DLC2TTR4aFortifyHealth  Auto  

MiscObject Property Gold  Auto  

GlobalVariable Property DLC2TT4aRun  Auto  
AchievementsScript Property AchievementsQuest Auto

SPELL Property DLC2CheckWater  Auto  
