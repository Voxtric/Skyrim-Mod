;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname BYOH_QF_DialogueDragonBridgeS_00052B90 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Horgeir
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Horgeir Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Clinton
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Clinton Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if (Alias_Clinton.GetActorRef().IsInFaction(BYOHRelationshipAdoptionFaction))
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property BYOHRelationshipAdoptionFaction  Auto  
