;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname QF_DLC2WaterStoneSailAwayQue_02027826 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; disable the peoples
; Debug.Trace("DCL2 Water Stone: Disabling the dudes.")

DisableMarker.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DisableMarker  Auto  
