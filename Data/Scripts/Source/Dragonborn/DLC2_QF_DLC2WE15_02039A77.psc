;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC2_QF_DLC2WE15_02039A77 Extends Quest Hidden

;BEGIN ALIAS PROPERTY TravelMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TravelMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TravelMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SceneCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SceneCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Actor4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Actor4 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DLC2WEScript
Quest __temp = self as Quest
DLC2WEScript kmyQuest = __temp as DLC2WEScript
;END AUTOCAST
;BEGIN CODE
Alias_Actor5.GetActorReference().RemoveFromFaction(dunPrisonerFaction) ; makes the netch not accept friendly hits from the player

Alias_Actor1.GetActorReference().AddToFaction(WEEnemiesFactionA)
Alias_Actor2.GetActorReference().AddToFaction(WEEnemiesFactionA)
Alias_Actor3.GetActorReference().AddToFaction(WEEnemiesFactionA)
Alias_Actor4.GetActorReference().AddToFaction(WEEnemiesFactionA)

Alias_Actor5.GetActorReference().AddToFaction(WEEnemiesFactionB)

Alias_Actor1.GetActorReference().SetActorValue("aggression", 1)
Alias_Actor2.GetActorReference().SetActorValue("aggression", 1)
Alias_Actor3.GetActorReference().SetActorValue("aggression", 1)
Alias_Actor4.GetActorReference().SetActorValue("aggression", 1)

Alias_Actor5.GetActorReference().SetActorValue("aggression", 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;player was forcegreeted
Alias_Actor1.GetActorReference().EvaluatePackage()
Alias_Actor2.GetActorReference().EvaluatePackage()
Alias_Actor3.GetActorReference().EvaluatePackage()
Alias_Actor4.GetActorReference().EvaluatePackage()
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
; debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Actor1.GetReference().DeleteWhenAble()
Alias_Actor2.GetReference().DeleteWhenAble()
Alias_Actor3.GetReference().DeleteWhenAble()
Alias_Actor4.GetReference().DeleteWhenAble()
Alias_Actor5.GetReference().DeleteWhenAble()

; debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; debug.trace(self + "stage 0")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property WEEnemiesFactionA  Auto  

Faction Property WEEnemiesFactionB  Auto  

Faction Property dunPrisonerFaction  Auto  
