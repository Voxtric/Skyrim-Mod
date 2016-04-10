;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC1_QF_DLC1VQDragonMisc_0101119F Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC1VQDragonMiscSCAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC1VQDragonMiscSCAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQDragonMiscAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQDragonMiscAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;This is set if the Player dismisses the talk with Durnehviir outside the Soul Cairn's prison
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Closes this out when no longer needed
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
