;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC1_QF_DLC1WEJS06_010127F0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiantSpider
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GiantSpider Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PostEncounterSandboxRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PostEncounterSandboxRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderDinner01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderDinner01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiantSpider02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GiantSpider02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiantSpiderSnow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GiantSpiderSnow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GiantSpiderSnow02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GiantSpiderSnow02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "stage 0")
Actor GiantSpider = Alias_GiantSpider.getReference() as Actor
Actor GiantSpider02 = Alias_GiantSpider02.getReference() as Actor
Actor GiantSpiderSnow = Alias_GiantSpiderSnow.getReference() as Actor
Actor GiantSpiderSnow02 = Alias_GiantSpiderSnow02.getReference() as Actor

;enables Snow version in snowy part of Skyrim
If ((alias_myHoldLocation.getLocation()==HaafingerHold)||(alias_myHoldLocation.getLocation()==ThePaleHold)||(alias_myHoldLocation.getLocation()==WinterholdHold))
     alias_GiantSpiderSnow.GetReference().Enable()
     alias_GiantSpiderSnow02.GetReference().Enable()
Else
     alias_GiantSpider.GetReference().Enable()
     alias_GiantSpider02.GetReference().Enable()
EndIf

GiantSpider.SetActorValue("Aggression", 3)
GiantSpider02.SetActorValue("Aggression", 3)
GiantSpiderSnow.SetActorValue("Aggression", 3)
GiantSpiderSnow02.SetActorValue("Aggression", 3)

GiantSpider.startCombat(GiantSpider02)
GiantSpider02.startCombat(GiantSpider)
GiantSpiderSnow.startCombat(GiantSpiderSnow02)
GiantSpiderSnow02.startCombat(GiantSpiderSnow)
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
Alias_GiantSpider02.GetReference().DeleteWhenAble()
Alias_GiantSpiderSnow02.GetReference().DeleteWhenAble()
Alias_SpiderDinner01.GetReference().DeleteWhenAble()


debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

location Property HaafingerHold Auto
location Property ThePaleHold Auto
location Property WinterholdHold auto
