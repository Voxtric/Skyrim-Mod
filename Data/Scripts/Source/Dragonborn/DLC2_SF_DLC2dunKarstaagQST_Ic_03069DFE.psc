;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_SF_DLC2dunKarstaagQST_Ic_03069DFE Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Karstaag.SummonIceWraiths()

if (GetOwningQuest().GetStage() == 20)
     GetOwningQuest().SetStage(21)
ElseIf (GetOwningQuest().GetStage() == 21)
     GetOwningQuest().SetStage(22)
ElseIf (GetOwningQuest().GetStage() == 22)
     GetOwningQuest().SetStage(23)
ElseIf (GetOwningQuest().GetStage() == 23)
     GetOwningQuest().SetStage(24)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC2dunKarstaagBattleScript property Karstaag auto
