;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC1_QF_DLC1VQElderHandler_010181BF Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC1VQElderRNPCAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQElderRNPCAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQElderHandlerUragAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQElderHandlerUragAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;DA04 has started up, Urag is going to get the book to kick it off now
SetObjectiveCompleted(10,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;This gets set if the Player hasn't done the MQ scroll stuff at all - points at Urag like MQ205 does
if isObjectiveDisplayed(10) == 0
SetObjectiveDisplayed(10,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Bought scroll back from Urag gro-Shub
SetObjectiveCompleted(20,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;This stage gets set if the Player had previously sold the scroll from main game (in Stage 10)
if isObjectiveDisplayed(20) == 0
SetObjectiveDisplayed(20,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;This quest initializes at the start of DLC1VQElder
;Check to see status of MQ Elder Scroll
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Went direct to Septimus - DA04 start
SetObjectiveCompleted(10,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
