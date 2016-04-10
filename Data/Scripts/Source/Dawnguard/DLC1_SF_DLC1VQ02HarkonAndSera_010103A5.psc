;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname DLC1_SF_DLC1VQ02HarkonAndSera_010103A5 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().setStage(9)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; try making Harkon raise his glass
Alias_Harkon.GetActorRef().PlayIdle(IdleMQ201ToastStart)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Harkon lowers his glass
; get rid of cup
Alias_Harkon.GetActorRef().PlayIdle(OffsetCarryMQ201DrinkR)
Alias_Harkon.GetActorRef().PlayIdle(OffsetStop)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Harkon  Auto  

Idle Property IdleMQ201ToastStart  Auto  

Idle Property OffsetStop  Auto  

Idle Property OffsetCarryMQ201DrinkR  Auto  
