;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname DLC1_QF_DLC1_WESC01_010034DE Extends Quest Hidden

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireLairDestination
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampireLairDestination Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VigilantHunter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VigilantHunter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vigilant02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vigilant02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vigilant01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vigilant01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Vampire killed.
;Debug.Trace("Stage 20 - Dead")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
;debug.trace(self + "stage 255, calling ReArmTrigger() on trigger" + Alias_Trigger.GetReference())
(Alias_Trigger.GetReference() as WETriggerScript).ReArmTrigger()
Alias_VigilantHunter.GetReference().DeleteWhenAble()
if (Alias_Vigilant01.GetReference() != None)
     Alias_Vigilant01.GetReference().DeleteWhenAble()
EndIf
if (Alias_Vigilant02.GetReference() != None)
     Alias_Vigilant02.GetReference().DeleteWhenAble()
EndIf
Alias_Vampire.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE WEScript
Quest __temp = self as Quest
WEScript kmyQuest = __temp as WEScript
;END AUTOCAST
;BEGIN CODE
;Debug.Trace("Starting Vampire")
Utility.Wait(6)
;Debug.Trace("Starting Vigilants")
Alias_VigilantHunter.GetReference().Enable()
if (Alias_Vigilant01.GetReference() != None)
     Alias_Vigilant01.GetReference().Enable()
EndIf
if (Alias_Vigilant02.GetReference() != None)
     Alias_Vigilant02.GetReference().Enable()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player landed a hit on the vampire.
;Debug.Trace("Stage 10 - Hit")
Alias_Vampire.GetActorRef().SetAV("Confidence", 2)
Alias_Vampire.GetActorRef().SetAV("Aggression", 2)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
