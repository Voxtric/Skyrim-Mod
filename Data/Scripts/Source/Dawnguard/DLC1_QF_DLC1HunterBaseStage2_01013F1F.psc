;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC1_QF_DLC1HunterBaseStage2_01013F1F Extends Quest Hidden

;BEGIN ALIAS PROPERTY SorineAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SorineAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ruunvald02Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ruunvald02Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IsranAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IsranAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FlorentiusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FlorentiusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GunmarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GunmarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ruunvald01Marker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ruunvald01Marker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TolanAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TolanAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
RuunvaldEnableMarker.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_FlorentiusAlias.GetReference().MoveTo(DLC1HunterBaseIntroFlorentiusMarkerRef)
Alias_FlorentiusAlias.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC1HunterBaseIntroFlorentiusMarkerRef  Auto  

ObjectReference Property RuunvaldEnableMarker  Auto  
