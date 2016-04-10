;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC1_QF_DLC1LD_CraftItemManag_0100CFFE Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Notify DLC1LD that the player has crafted an item with the Aetherium Forge.
DLC1LD.SetStage(225)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC1LD  Auto  
