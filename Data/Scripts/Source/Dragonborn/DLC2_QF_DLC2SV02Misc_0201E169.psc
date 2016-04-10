;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname DLC2_QF_DLC2SV02Misc_0201E169 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Fanari
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fanari Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Deor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Deor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Baldor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Baldor Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(10)
DLC2SV02.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Move Baldor to POI1 hut
Alias_Baldor.GetReference().MoveTo(DLC2SV02BaldorKidnappedMarker)

;Move Deor and Fanari into position for their scene
Alias_Fanari.GetReference().Moveto(DLC2SV02MiscFanariStand)
Alias_Deor.GetReference().Moveto(DLC2SV02MiscDeorStand)

SetStage(5)
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

ObjectReference Property DLC2SV02BaldorKidnappedMarker  Auto  

ObjectReference Property DLC2SV02MiscDeorStand  Auto  

ObjectReference Property DLC2SV02MiscFanariStand  Auto  

Scene Property DLC2SV02MiscScene  Auto  

Quest Property DLC2SV02  Auto  
