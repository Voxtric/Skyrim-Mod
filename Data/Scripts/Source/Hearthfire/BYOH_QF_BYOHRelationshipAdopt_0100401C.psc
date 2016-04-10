;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname BYOH_QF_BYOHRelationshipAdopt_0100401C Extends Quest Hidden

;BEGIN ALIAS PROPERTY PatrolChores2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PatrolChores2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FamilyCritter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FamilyCritter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SandboxHome
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SandboxHome Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY childChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_childChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DollMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DollMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PatrolChores1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PatrolChores1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SandboxHome03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SandboxHome03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentHomeCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CurrentHomeCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DiningTable
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DiningTable Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bed2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bed2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TransientCritter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TransientCritter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bed1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bed1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentHomeLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CurrentHomeLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SandboxRoom
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SandboxRoom Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SandboxHome02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SandboxHome02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Child2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Child2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SandboxHome04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SandboxHome04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PetDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PetDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Child1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Child1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentHomeExterior
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CurrentHomeExterior Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PracticeDummy
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PracticeDummy Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SandboxOutside
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SandboxOutside Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentHomestead
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CurrentHomestead Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FamilyPet
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FamilyPet Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Register the child's chest to fill.
((Self as Quest) as BYOHRelationshipAdoptionSc).RegisterForChestUpdate()

;Make sure all four of the SandboxHome aliases are filled.
if (Alias_SandboxHome02.GetReference() == None)
     Alias_SandboxHome02.ForceRefTo(Alias_SandboxHome.GetReference())
EndIf
if (Alias_SandboxHome03.GetReference() == None)
     Alias_SandboxHome03.ForceRefTo(Alias_SandboxHome.GetReference())
EndIf
if (Alias_SandboxHome04.GetReference() == None)
     Alias_SandboxHome04.ForceRefTo(Alias_SandboxHome.GetReference())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
