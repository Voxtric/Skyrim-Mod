;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC2_QF_DLC2dunFrostmoonQSTMi_02035E2F Extends Quest Hidden

;BEGIN ALIAS PROPERTY QT_Majni
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_Majni Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Display the objective.
if (!GetStageDone(10))
     SetObjectiveDisplayed(11)
     DLC2FrostmoonCragMapMarker.AddToMap()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Display the objective.
if (!GetStageDone(11))
     SetObjectiveDisplayed(10)
     DLC2FrostmoonCragMapMarker.AddToMap()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Clear the objective.
SetObjectiveDisplayed(10, False)
SetObjectiveDisplayed(11, False)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Complete the objective.
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC2FrostmoonCragMapMarker  Auto  
