;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC1_SF_DLC1VQ03VampireDexion_0100886F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Alias_Dexion.GetActorRef().EquipItem(ElderScrollHandAttachArmor3rdP, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().SetStage(120)
Alias_Dexion.GetActorRef().UnEquipItem(ElderScrollHandAttachArmor3rdP, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Dexion  Auto  

Armor Property ElderScrollHandAttachArmor3rdP  Auto  
