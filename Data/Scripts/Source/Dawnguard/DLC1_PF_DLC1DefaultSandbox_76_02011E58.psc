;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC1_PF_DLC1DefaultSandbox_76_02011E58 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
; actor holds drink
akActor.PlayIdle(OffsetCarryMQ201DrinkR)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(Actor akActor)
;BEGIN CODE
; put away drink
akActor.PlayIdle(OffsetStop)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property OffsetCarryMQ201DrinkR  Auto  

Idle Property OffsetStop  Auto  
