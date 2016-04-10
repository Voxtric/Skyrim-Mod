;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC2_QF_DLC2RRFavor01_02024DDE Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RRF01BarrelAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF01BarrelAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRFVelethAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRFVelethAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Done
SetObjectiveCompleted(20,1)
Game.GetPlayer().AddItem(pDLC2RRFavorGoldAward)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player found the stash
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest is available on game start
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player accepted the quest
Alias_DLC2RRF01BarrelAlias.GetRef().Enable()
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pDLC2RRFavorGoldAward  Auto  
