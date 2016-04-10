;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_QF_DLC1VQ08Post_0101A1C1 Extends Quest Hidden

;BEGIN ALIAS PROPERTY GunmarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GunmarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GaranAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GaranAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RargalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RargalAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CelannAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CelannAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DurakAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DurakAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IngjardAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IngjardAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SeranaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SeranaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FeranAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FeranAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BelevalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BelevalAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SorineAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SorineAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossRoomMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossRoomMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DexionAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DexionAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrthjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OrthjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AgmaerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AgmaerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VingalmoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VingalmoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HarkonDeathMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HarkonDeathMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RonthilAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RonthilAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FuraAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FuraAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FlorentiusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FlorentiusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IsranAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IsranAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HestlaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HestlaAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Auto-initiated at the end of VQ08
DLC1HunterHQPlayerRoomInitEnabled.Disable()
if (DLC1PlayingVampireLine.GetValue())== 0
Alias_IsranAlias.GetReference().MoveTo(Alias_BossRoomMarkerAlias.GetReference())
Utility.Wait(1)
DLC1VQ08PostIsranScene.Start()
else
Alias_GaranAlias.GetReference().MoveTo(Alias_BossRoomMarkerAlias.GetReference())
DLC1HarkonCoffinRef.SetActorOwner(Game.GetPlayer().GetActorBase())
Utility.Wait(1)
DLC1VQ08PostGaranScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pDLC1PlayingVampireLine  Auto  

GlobalVariable Property DLC1PlayingVampireLine  Auto  



Scene Property DLC1VQ08PostIsranScene  Auto  

Scene Property DLC1VQ08PostGaranScene  Auto  

ObjectReference Property DLC1HunterHQPlayerRoomInitEnabled  Auto  

ObjectReference Property DLC1HarkonCoffinRef  Auto  
