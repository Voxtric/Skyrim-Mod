;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname DLC1_QF_DLC1_WESC08_0100351E Extends Quest Hidden

;BEGIN ALIAS PROPERTY VampireRemains1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampireRemains1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AppropriateLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AppropriateLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireRemains2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampireRemains2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DawnguardLynoit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DawnguardLynoit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireRemains3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampireRemains3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;debug.trace(self + "stage 0")
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
;debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_DawnguardLynoit.GetReference().DeleteWhenAble()
Alias_VampireRemains1.GetReference().DeleteWhenAble()
Alias_VampireRemains2.GetReference().DeleteWhenAble()
Alias_VampireRemains3.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Flag: Has the player approached this WE?
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Activator Property FXbatGroupACT  Auto  

Quest Property DLC01WESC03  Auto  

Book Property DLC1_WESC08Orders  Auto  

Quest Property DLC1_WESC08  Auto  
