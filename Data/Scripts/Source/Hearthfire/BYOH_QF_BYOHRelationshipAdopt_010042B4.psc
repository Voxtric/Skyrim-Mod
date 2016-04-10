;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname BYOH_QF_BYOHRelationshipAdopt_010042B4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Child2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Child2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TransientCritter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TransientCritter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FamilyPet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FamilyPet Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentHomeHold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CurrentHomeHold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentHomeExterior
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CurrentHomeExterior Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FamilyCritter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FamilyCritter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentHomeHouse
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CurrentHomeHouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Child1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Child1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TransientPet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TransientPet Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Standard running state. Player has adopted one or more children.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Any startup stage scripts could go here. Not currently necessary.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RelationshipAdoption  Auto  

Faction Property PlayerAdoptedFaction  Auto  

ActorBase Property TestAdoptionGirl  Auto  
