;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname BYOH_QF_BYOHRelationshipAdopt_01004286 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Orphan02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orphan02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Runa
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Runa Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Francois
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Francois Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Constance
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Constance Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Aventus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aventus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orphan06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orphan06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orphan03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orphan03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orphan04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orphan04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orphan05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orphan05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orphan07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orphan07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Orphan01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Orphan01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hroar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hroar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Samuel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Samuel Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has failed out of the adoption questionnaire (no house or child's bedroom).
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Shut down orphanage adoptions.
((Self as Quest) as BYOHRelationshipAdoptableOrphanageSc).DisableOrphanageAdoptions()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player has completed the adoption questionnaire and is selecting a child.
((Self as Quest) as BYOHRelationshipAdoptableOrphanageSc).EnableOrphanageAdoptions()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player has begun the adoption questionnaire.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Initial state.

;Notify the script that we've started.
((Self as Quest) as BYOHRelationshipAdoptableOrphanageSc).QuestStarted()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has adopted at least one child from the Orphanage.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property RelationshipAdoptableFaction  Auto
bool Property AllowOrphanageAdoption Auto Conditional
