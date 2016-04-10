;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC1_QF_DLC1_WESC03_010034D0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bat07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bat07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bat03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bat03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ScriptManager
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ScriptManager Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bat10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bat10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bat06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bat06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bat01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bat01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bat04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bat04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bat02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bat02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bat08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bat08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bat09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bat09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bat05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bat05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
;debug.trace(self + "stage 0")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Bats have spawned and triggered.
;debug.trace(self + "stage 10")
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
Alias_Bat01.GetReference().DeleteWhenAble()
Alias_Bat02.GetReference().DeleteWhenAble()
Alias_Bat03.GetReference().DeleteWhenAble()
Alias_Bat04.GetReference().DeleteWhenAble()
Alias_Bat05.GetReference().DeleteWhenAble()
Alias_Bat06.GetReference().DeleteWhenAble()
Alias_Bat07.GetReference().DeleteWhenAble()
Alias_Bat08.GetReference().DeleteWhenAble()
Alias_Bat09.GetReference().DeleteWhenAble()
Alias_Bat10.GetReference().DeleteWhenAble()
Alias_ScriptManager.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Activator Property FXbatGroupACT  Auto  

Quest Property DLC01WESC03  Auto  
