;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC1_QF_DLC1HunterBaseEnableS_010198B2 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DLC1HunterHQBSmithInitEnabled.Disable()
DLC1HunterHQEncInitEnabled.Disable()
DLC1HunterHQTrollInitEnabled.Disable()
DLC1HunterHQBarracksInitEnabled.Disable()
SorineAlias.GetActorReference().SetOutfit(DLC1OutfitSorine)
GunmarAlias.GetActorReference().SetOutfit(DLC1OutfitGunmar)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC1HunterHQTrollInitEnabled  Auto  

ObjectReference Property DLC1HunterHQBSmithInitEnabled  Auto  

ObjectReference Property DLC1HunterHQEncInitEnabled  Auto  

ObjectReference Property DLC1HunterHQBarracksInitEnabled  Auto  

ReferenceAlias Property SorineAlias  Auto  

ReferenceAlias Property GunmarAlias  Auto  

Outfit Property DLC1OutfitSorine  Auto  

Outfit Property DLC1OutfitGunmar  Auto  
