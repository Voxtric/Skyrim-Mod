;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_SF_DLC2dunKarstaagQST_Ic_02028240 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;We keep a count to cycle through the dialogue lines.
;Increment the count.
DLC2dunKarstaagIceWraithCount.Mod(1)
;If it's now 4, reset to 0.
if (DLC2dunKarstaagIceWraithCount.GetValue() >= 4)
     DLC2dunKarstaagIceWraithCount.SetValue(0)
EndIf

;Summon Ice Wraiths.
Karstaag.SummonIceWraiths()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC2dunKarstaagBattleScript property Karstaag auto

GlobalVariable Property DLC2dunKarstaagIceWraithCount  Auto  
