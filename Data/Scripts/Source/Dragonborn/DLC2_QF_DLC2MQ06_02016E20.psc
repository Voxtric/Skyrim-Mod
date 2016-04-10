;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname DLC2_QF_DLC2MQ06_02016E20 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Book3ApocryphaTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book3ApocryphaTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Llunela
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Llunela Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book3DungeonTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book3DungeonTarget Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player meets Llunela in Tel Nelathi
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20) ; give book 1 to Llunela
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; player reads book 3 in Apocrypha
CompleteAllObjectives()
; start MQ07
DLC2MQ07.SetStage(10)
; shut down ?
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; start quest
SetObjectiveDisplayed(10)
SetActive(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; player reads book 3
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40) ; find hidden knowledge
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; quickstart
DLC2MQ05.SetStage(0)
DLC2MQ05.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; player gives book to Llunela
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30) ; find book 3
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2MQ07  Auto  

Quest Property DLC2MQ05  Auto  
