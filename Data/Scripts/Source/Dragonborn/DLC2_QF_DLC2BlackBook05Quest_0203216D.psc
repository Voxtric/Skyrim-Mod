;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_QF_DLC2BlackBook05Quest_0203216D Extends Quest Hidden

;BEGIN ALIAS PROPERTY BookTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BookTarget Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
DLC2BookDungeonController.IncrementBookFinished()
SetObjectiveCompleted(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


DLC2BookDungeonControllerScript Property DLC2BookDungeonController  Auto  

