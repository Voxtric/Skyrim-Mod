;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname QF_DLC2MHMisc_0202BAB0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ThirskCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThirskCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RetreatCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RetreatCenter Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
Stop()
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
