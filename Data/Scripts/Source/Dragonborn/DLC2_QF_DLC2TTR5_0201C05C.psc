;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_QF_DLC2TTR5_0201C05C Extends Quest Hidden

;BEGIN ALIAS PROPERTY AshSpawnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshSpawnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AshSpawn1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshSpawn1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AshSpawn2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshSpawn2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AshSpawn3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshSpawn3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; player gets quest

SetObjectiveDisplayed(100, true)

DLC2TTR5CastSpellScene.Start()
Game.GetPlayer().AddPerk(DLC2TTR5BriarheartHarvestPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; player gets briarheart

SetObjectiveCompleted(100, true)
SetObjectiveDisplayed(200, true)

Game.GetPlayer().RemovePerk(DLC2TTR5BriarheartHarvestPerk)

Alias_AshSpawn1.GetRef().Enable()
Alias_AshSpawn2.GetRef().Enable()
Alias_AshSpawn3.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player returns to Neloth

SetObjectiveCompleted(200, true)
game.GetPlayer().AddItem(Gold, 250)
game.GetPlayer().DispelSpell(DLC2TTR5MemoryStored)
game.GetPlayer().RemoveSpell(DLC2TTR5MemoryStored)

DLC2TT2.start()

AchievementsQuest.IncSideQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property DLC2TTR5BriarheartHarvestPerk  Auto  

MiscObject Property Gold  Auto  

Quest Property DLC2TT2  Auto  

AchievementsScript Property AchievementsQuest Auto

Scene Property DLC2TTR5CastSpellScene  Auto  

SPELL Property DLC2TTR5MemoryStored  Auto  
