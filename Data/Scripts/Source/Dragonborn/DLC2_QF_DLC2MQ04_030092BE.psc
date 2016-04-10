;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 22
Scriptname DLC2_QF_DLC2MQ04_030092BE Extends Quest Hidden

;BEGIN ALIAS PROPERTY DwemerCubeTarget04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DwemerCubeTarget04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Miraak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Miraak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BoilerTarget1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BoilerTarget1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BoilerTarget4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BoilerTarget4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BoilerTarget2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BoilerTarget2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakReadingRoomTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakReadingRoomTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DwemerCubeTarget05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DwemerCubeTarget05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Storn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Storn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BoilerTarget3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BoilerTarget3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DwemerCubeTarget03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DwemerCubeTarget03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DwemerCubeTarget01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DwemerCubeTarget01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DwemerCubeTarget02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DwemerCubeTarget02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nchardak
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Nchardak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; player has read book - into Apocrypha
SetObjectiveCompleted(50) ; "Read book"
SetObjectiveDisplayed(60) ; "learn hidden knowledge"
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; Llunela explains that need to turn on steam to room
; change QT to boiler room
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; player has hidden knowledge
SetObjectiveCompleted(60) ; "learn hidden knowledge"
SetObjectiveDisplayed(70) ; defeat dragon
; trigger dragon attack - TODO
; TEMP:
DLC2dunNchardak_RubbleEnable.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player arrives at Nchardak - trigger Miraak's attack
Alias_Miraak.GetRef().Enable() ; TODO
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Llunela explains the need to find cubes
; give player objectives to the cubes
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetObjectiveCompleted(40) ; put book 2 into device
setObjectiveDisplayed(50) ; read book 2
; QT points first to furniture - waiting for player to sit in device
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; dragon dead
CompleteAllObjectives()
; transition to MQ05
DLC2MQ05.SetStage(10)
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

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; player is in device - move QT to book itself
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; quickstart
DLC2MQ03.SetStage(0)
DLC2MQ03.SetStage(200)
; TEMP
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; player has powered up the reading room - complete quest
SetObjectiveCompleted(30) ; repair reading room
CompleteAllObjectives()
; transition to MQ05
DLC2MQ05.SetStage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; player has all the cubes - QT to boilers (plus QTs to any cubes not in player's inventory)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Miraak defeated - proceed inside
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)
; first objective is the reading device itself
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2MQ04  Auto  

Quest Property DLC2MQ06  Auto  

ObjectReference Property DLC2dunNchardak_RubbleEnable  Auto  

Quest Property DLC2MQ03  Auto  

Quest Property DLC2MQ05  Auto  

