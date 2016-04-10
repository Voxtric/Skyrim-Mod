;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC2_QF__031133E3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Nikulas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nikulas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Edla
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Edla Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;SetObjectiveCompleted(20)
;Game.GetPlayer().AddItem(DLC2ArmorNordicHeavyHelmet, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
