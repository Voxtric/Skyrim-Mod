;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC1_QF_DLC1_WESC04_010034D4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SceneMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TargetDungeonMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TargetDungeonMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeleton01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skeleton01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeleton02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skeleton02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ScriptManager
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ScriptManager Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AssassinationWrit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AssassinationWrit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TargetDungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TargetDungeon Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
;debug.trace(self + "stage 0")
Alias_Vampire.GetReference().AddItem(Alias_AssassinationWrit.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Add the map marker to the player's map.
Alias_TargetDungeonMapMarker.GetReference().AddToMap()

;Debug.Trace("100: " + Alias_ScriptManager.GetReference().Is3DLoaded())
if (GetStageDone(100) && !Alias_ScriptManager.GetReference().Is3DLoaded())
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;ScriptManager has unloaded.
;Debug.Trace("110: " + Alias_ScriptManager.GetReference().Is3DLoaded())
if (GetStageDone(100) && !Alias_ScriptManager.GetReference().Is3DLoaded())
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Vampire has spawned in.
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
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Skeleton01.GetReference().DeleteWhenAble()
Alias_Skeleton02.GetReference().DeleteWhenAble()
Alias_Vampire.GetReference().DeleteWhenAble()
Alias_ScriptManager.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Activator Property FXbatGroupACT  Auto  

Quest Property DLC01WESC03  Auto  
