;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC1_QF_DLC1_WESC02_010034EA Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireLeader
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampireLeader Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameAlias_Vampire01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameAlias_Vampire01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vigilant01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vigilant01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vigilant02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vigilant02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vigilant03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vigilant03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameAlias_Vampire02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameAlias_Vampire02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameAlias_Vampire03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameAlias_Vampire03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("Starting Vampire Vigilants.")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Second line complete, or vampires become hostile in some other way.
Debug.Trace("Stage 20 - Vampires become hostile.")
Alias_NameAlias_Vampire01.Clear()
Alias_NameAlias_Vampire02.Clear()
Alias_NameAlias_Vampire03.Clear()
Alias_VampireLeader.GetActorRef().SetAV("Aggression", 2)
Alias_Vampire02.GetActorRef().SetAV("Aggression", 2)
if (Alias_Vampire03.GetActorRef() != None)
     Alias_Vampire03.GetActorRef().SetAV("Aggression", 2)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
;debug.trace("Stage 255 - Calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()

Alias_VampireLeader.GetReference().DeleteWhenAble()
Alias_Vampire02.GetReference().DeleteWhenAble()
if (Alias_Vampire03.GetActorRef() != None)
     Alias_Vampire03.GetReference().DeleteWhenAble()
EndIf
Alias_Vigilant01.GetReference().DeleteWhenAble()
Alias_Vigilant02.GetReference().DeleteWhenAble()
if (Alias_Vigilant03.GetActorRef() != None)
     Alias_Vigilant03.GetReference().DeleteWhenAble()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Initial line complete. Wait for player to approach.
;Debug.Trace("Stage 10 - Initial Line Complete")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC01_WESC02_VampireDLG  Auto  
