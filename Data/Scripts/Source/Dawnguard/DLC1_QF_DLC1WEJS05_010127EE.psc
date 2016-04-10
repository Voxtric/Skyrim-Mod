;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC1_QF_DLC1WEJS05_010127EE Extends Quest Hidden

;BEGIN ALIAS PROPERTY GiantSpiderSnow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GiantSpiderSnow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiantSpider
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GiantSpider Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderDinner01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderDinner01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderDinner03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderDinner03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostEncounterSandboxRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostEncounterSandboxRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderDinner02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderDinner02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "stage 0")

;enables Snow version in snowy part of Skyrim
If ((alias_myHoldLocation.getLocation()==HaafingerHold)||(alias_myHoldLocation.getLocation()==ThePaleHold)||(alias_myHoldLocation.getLocation()==WinterholdHold))
     alias_GiantSpiderSnow.GetReference().Enable()
Else
     alias_GiantSpider.GetReference().Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_GiantSpider.GetReference().DeleteWhenAble()
Alias_GiantSpiderSnow.GetReference().DeleteWhenAble()
Alias_SpiderDinner01.GetReference().DeleteWhenAble()
Alias_SpiderDinner02.GetReference().DeleteWhenAble()
Alias_SpiderDinner03.GetReference().DeleteWhenAble()

debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

location property HaafingerHold auto
location property ThePaleHold auto
location property WinterholdHold auto
