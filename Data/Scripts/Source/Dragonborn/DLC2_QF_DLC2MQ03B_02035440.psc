;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 42
Scriptname DLC2_QF_DLC2MQ03B_02035440 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SunStoneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SunStoneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaterStoneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaterStoneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LurkerSun
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LurkerSun Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LurkerWater
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LurkerWater Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LurkerEarth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LurkerEarth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Storn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Storn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LurkerBeast
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LurkerBeast Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EarthStoneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EarthStoneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeastStoneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BeastStoneAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; water stone cleansed
SetObjectiveCompleted(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
; earth
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; all pillars cleansed
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
; all pillars cleansed
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
; all pillars cleansed
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; sun stone
SetObjectiveCompleted(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
; water stone
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; sun stone shouted
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; beast stone shouted
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
DLC2MQ00.SetStage(10) ; add map markers to all stones
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; earth stone shouted
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; earth stone cleansed
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
; sun
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
; all stones already cleansed
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; Water stone shouted
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
; beast
setObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; beast stone
SetObjectiveCompleted(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
; all pillars cleansed
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; complete quest
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2MQ04  Auto  

Quest Property DLC2MQ02  Auto  

WordofPower Property DLC2VoiceBendToWill1  Auto  

Scene Property FreaStornScene  Auto  

ObjectReference Property DLC2MQ03SkaalVillageBarrier  Auto  

ObjectReference Property DLC2PillarBuildSandboxMarkerTOGGLEWind  Auto  
{wind pillar marker - disable to put Skaal back to normal}

Book Property DLC2BlackBook01  Auto  

Quest Property DLC2MQ00  Auto  
