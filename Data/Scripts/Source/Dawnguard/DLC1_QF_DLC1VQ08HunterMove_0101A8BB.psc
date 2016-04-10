;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC1_QF_DLC1VQ08HunterMove_0101A8BB Extends Quest Hidden

;BEGIN ALIAS PROPERTY CelannAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CelannAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SorineAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SorineAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IsranAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IsranAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DurakCastleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DurakCastleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IngjardAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IngjardAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgmaerCastleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgmaerCastleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GunmarCastleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GunmarCastleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FlorentiusCastleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FlorentiusCastleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BelevalCastleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BelevalCastleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IsranCastleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IsranCastleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FlorentiusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FlorentiusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CelannCastleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CelannCastleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IngjardCastleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IngjardCastleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SorineCastleMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SorineCastleMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BelevalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BelevalAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GunmarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GunmarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgmaerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgmaerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrollAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrollAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DurakAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DurakAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_IsranAlias.GetReference().MoveTo(Alias_IsranCastleMarker.GetReference())
Alias_TrollAlias.GetReference().MoveTo(Alias_IsranAlias.GetReference())
VQ08TrollAlias.ForceRefTo(Alias_TrollAlias.GetReference())
Alias_SorineAlias.GetReference().MoveTo(Alias_SorineCastleMarker.GetReference())
Alias_GunmarAlias.GetReference().MoveTo(Alias_GunmarCastleMarker.GetReference())
if DLC1HunterBaseStage2.GetStage()==200
Alias_FlorentiusAlias.GetReference().MoveTo(Alias_FlorentiusCastleMarker.GetReference())
endif
;if (Alias_AgmaerAlias.GetActorReference().IsDead()) == false
;if (Alias_AgmaerAlias.GetActorReference().IsInFaction(CurrentFollowerFaction)) == False
;Alias_AgmaerAlias.GetReference().MoveTo(Alias_AgmaerCastleMarker.GetReference())
;endif
;endif
;if (Alias_BelevalAlias.GetActorReference().IsDead()) == false
;if (Alias_BelevalAlias.GetActorReference().IsInFaction(CurrentFollowerFaction)) == False
;Alias_BelevalAlias.GetReference().MoveTo(Alias_BelevalCastleMarker.GetReference())
;endif
;endif
if (Alias_CelannAlias.GetActorReference().IsDead()) == false
if (Alias_CelannAlias.GetActorReference().IsInFaction(CurrentFollowerFaction)) == False
Alias_CelannAlias.GetReference().MoveTo(Alias_CelannCastleMarker.GetReference())
endif
endif
if (Alias_DurakAlias.GetActorReference().IsDead()) == false
if (Alias_DurakAlias.GetActorReference().IsInFaction(CurrentFollowerFaction)) == False
Alias_DurakAlias.GetReference().MoveTo(Alias_DurakCastleMarker.GetReference())
endif
endif
;if (Alias_IngjardAlias.GetActorReference().IsDead()) == false
;if (Alias_IngjardAlias.GetActorReference().IsInFaction(CurrentFollowerFaction)) == False
;Alias_IngjardAlias.GetReference().MoveTo(Alias_IngjardCastleMarker.GetReference())
;endif
;endif
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC1VQ08  Auto  

ReferenceAlias Property VQ08TrollAlias  Auto  

Faction Property CurrentFollowerFaction  Auto  

Quest Property DLC1HunterBaseStage2  Auto  
