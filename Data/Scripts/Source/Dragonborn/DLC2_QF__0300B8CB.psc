;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC2_QF__0300B8CB Extends Quest Hidden

;BEGIN ALIAS PROPERTY Baldor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Baldor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Deor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Deor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Map
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Map Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ancarion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ancarion Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Manage objectives
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Move Baldor
;DLC2SVBaldorIronShaperRef.Moveto(x)
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

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Enable the ship, Ancarion and his Thalmor guards
;marker.disable

;Manage objectives
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC2SV01TharstanMarker  Auto  

ObjectReference Property DLC2SVTharstanRef  Auto  
