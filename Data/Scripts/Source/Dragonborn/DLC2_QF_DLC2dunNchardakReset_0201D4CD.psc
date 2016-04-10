;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_QF_DLC2dunNchardakReset_0201D4CD Extends Quest Hidden

;BEGIN ALIAS PROPERTY Enemy04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enemy04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_NchardakLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enemy02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enemy02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enemy07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enemy07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enemy05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enemy05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enemy01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enemy01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enemy06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enemy06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Enemy03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Enemy03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Enemy01.GetActorRef().Reset()
Alias_Enemy02.GetActorRef().Reset()
Alias_Enemy03.GetActorRef().Reset()
Alias_Enemy04.GetActorRef().Reset()
Alias_Enemy05.GetActorRef().Reset()
Alias_Enemy06.GetActorRef().Reset()
Alias_Enemy07.GetActorRef().Reset()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
