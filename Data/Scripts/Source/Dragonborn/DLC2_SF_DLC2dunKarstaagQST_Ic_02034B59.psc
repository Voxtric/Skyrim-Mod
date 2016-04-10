;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC2_SF_DLC2dunKarstaagQST_Ic_02034B59 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;We keep a count to cycle through the dialogue lines.
;Increment the count.
DLC2dunKarstaagIceWraithCount.Mod(1)
;If it's now 4, reset to 0.
if (DLC2dunKarstaagIceWraithCount.GetValue() >= 4)
     DLC2dunKarstaagIceWraithCount.SetValue(0)
EndIf

;Summon Ice Wraiths.
(ConjuredKarstaag.GetActorRef() as DLC2dunKarstaagSummonScript).SummonIceWraiths()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property ConjuredKarstaag  Auto  

GlobalVariable Property DLC2dunKarstaagIceWraithCount  Auto  
