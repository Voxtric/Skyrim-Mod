;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC2_QF_DLC2RRFavor03_02024DFC Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RRF03Spawn03Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03Spawn03Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03TombLocAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC2RRF03TombLocAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QTTomb
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QTTomb Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03ElderAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03ElderAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03Spawn02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03Spawn02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03Spawn11Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03Spawn11Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03Spawn06Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03Spawn06Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03Spawn01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03Spawn01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03Spawn07Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03Spawn07Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03Spawn08Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03Spawn08Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03Spawn10Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03Spawn10Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03Spawn04Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03Spawn04Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03Spawn09Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03Spawn09Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF03Spawn05Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03Spawn05Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest is available at game start
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has slain all of the ash spawn
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has accepted the quest
SetObjectiveDisplayed(10,1)
Game.GetPlayer().AddItem(pDLC2RRTempleTombKey,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Quest is finished
SetObjectiveCompleted(20,1)
Game.GetPlayer().AddItem(pDLC2RRFavorGoldAward)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property pDLC2RRTempleTombKey  Auto  

LeveledItem Property pDLC2RRFavorGoldAward  Auto  
