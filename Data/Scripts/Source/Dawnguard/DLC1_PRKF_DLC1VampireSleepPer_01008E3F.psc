;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname DLC1_PRKF_DLC1VampireSleepPer_01008E3F Extends Perk Hidden

;BEGIN FRAGMENT Fragment_7
Function Fragment_7(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
DLC1VampireSleep.PlayerActivateBed(IsCoffin = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
DLC1VampireSleep.PlayerActivateBed(IsCoffin = false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1VampireSleepScript Property DLC1VampireSleep  Auto  
