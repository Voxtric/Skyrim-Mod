;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname BYOH_QF_BYOHRelationshipAdopt_01003F7B Extends Quest Hidden

;BEGIN ALIAS PROPERTY HomeCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HomeCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HomeCitySteward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HomeCitySteward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NoteMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NoteMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Home
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Home Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Note
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Note Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(WICourier as WICourierScript).AddItemToContainer(Alias_Note.GetReference())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property WICourier  Auto  
