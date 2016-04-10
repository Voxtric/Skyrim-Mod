;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname DLC2_SF_DLC2MQ02MiraakApocryp_0201CB66 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
dragonAlias.GetActorRef().SetDontMove(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;allow player to look around (limited to up/down while in animation)
Game.EnablePlayerControls(False, False, False, True, False, False, False, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
dragonalias.GetReference().Activate(MQ02Miraak.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
Game.GetPlayer().PlayIdle(DLC2FallOnKnees)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
dragonAlias.GetActorRef().SetDontMove(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
MQ02Miraak.GetActorReference().EquipItem(DLC2DragonbornAspectArmor3, TRUE, TRUE)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(DLC2BookDungeonController as DLC2BookDungeonControllerScript).MovePlayerHome()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2BookDungeonController  Auto  

ReferenceAlias Property dragonAlias  Auto  

Idle Property DLC2FallOnKnees  Auto  

Idle Property OffsetStop  Auto  

Armor Property DLC2DragonbornAspectArmor3  Auto  

ReferenceAlias Property MQ02Miraak  Auto  
