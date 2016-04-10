;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC1_QF_DLC1DialogueHunterBas_01004E0D Extends Quest Hidden

;BEGIN ALIAS PROPERTY IsranAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IsranAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BelevalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BelevalAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GunmarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GunmarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArielleAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArielleAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CelannAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CelannAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TolanAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TolanAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DurakAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DurakAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgmaerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgmaerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FlorentiusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FlorentiusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IngjardAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IngjardAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_AgmaerAlias.GetReference().Enable()
Alias_AgmaerAlias.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_BelevalAlias.GetReference().Enable()
Alias_BelevalAlias.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_CelannAlias.GetReference().Enable()
Alias_CelannAlias.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_DurakAlias.GetReference().Enable()
Alias_DurakAlias.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)
Alias_IngjardAlias.GetReference().Enable()
Alias_IngjardAlias.GetActorReference().SetRelationshipRank(Game.Getplayer(), 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
