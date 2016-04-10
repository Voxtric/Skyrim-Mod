;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_QF_DLC2TTR3a_0201B65D Extends Quest Hidden

;BEGIN ALIAS PROPERTY AshSample
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshSample Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AshExtractor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshExtractor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Player is given the quest

SetObjectiveDisplayed(100, true)

game.GetPlayer().AddItem(alias_AshExtractor.GetRef(), 1)
game.GetPlayer().AddPerk(DLC2TTR3aAshExtractionPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Player extract ash sample

SetObjectiveCompleted(100, true)
SetObjectiveDisplayed(200, true)

game.GetPlayer().RemovePerk(DLC2TTR3aAshExtractionPerk)
Alias_Ashsample.GetRef().Enable()
game.GetPlayer().AddItem(Alias_AshSample.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Player returns to Neloth

SetObjectiveCompleted(200, true)
game.GetPlayer().AddItem(Gold, 250)
game.GetPlayer().RemoveItem(alias_AshExtractor.GetRef(), 1)
game.GetPlayer().RemoveItem(DLC2TTR3aAshSample, 1)
DLC2ConjureAshSpawnForSale.SetValue(0)
DLC2TT3aRun.SetValue(1)

AchievementsQuest.IncSideQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property DLC2TTR3aAshExtractionPerk  Auto  

MiscObject Property Gold  Auto  

MiscObject Property DLC2TTR3aAshSample  Auto  

GlobalVariable Property DLC2ConjureAshSpawnForSale  Auto  

GlobalVariable Property DLC2TT3aRun  Auto  
AchievementsScript Property AchievementsQuest Auto
