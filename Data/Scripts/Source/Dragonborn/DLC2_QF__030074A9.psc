;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_QF__030074A9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Baldor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Baldor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Map
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Map Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Deor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Deor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Move Tharstan into the dungeon
DLC2SVTharstanRef.MoveTo(DLC2SV01TharstanMarker)

;Manage objectives
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Manage objectives
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC2SV01TharstanMarker  Auto  

ObjectReference Property DLC2SVTharstanRef  Auto  
