;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname DLC1_QF_DLC1_WESC06_01003511 Extends Quest Hidden

;BEGIN ALIAS PROPERTY myHoldContested
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldContested Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TRIGGER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TRIGGER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AppropriateLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_AppropriateLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DawnguardDestination
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DawnguardDestination Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldSons
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldSons Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY myHoldImperial
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_myHoldImperial Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dawnguard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dawnguard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DawnguardNameReplacement
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DawnguardNameReplacement Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Forcegreet complete.
;Debug.Trace("Stage 40 - Forcegreet Complete")
Alias_DawnguardNameReplacement.ForceRefTo(Alias_Dawnguard.GetActorRef())
Alias_Dawnguard.GetActorRef().RemoveFromFaction(DLC1DawnguardFaction)
ObjectReference obj
if (Alias_Dawnguard.GetActorRef().GetItemCount(DLC1ArmorDawnguardBody1) > 0)
     Alias_Dawnguard.GetActorRef().RemoveItem(DLC1ArmorDawnguardBody1)
     obj = Alias_Dawnguard.GetActorRef().PlaceAtMe(DLC1ArmorDawnguardBody1)
     obj.MoveTo(obj, 0, 0, 5)
     Alias_Dawnguard.GetActorRef().EquipItem(ReplacementClothes, True, True)
EndIf
if (Alias_Dawnguard.GetActorRef().GetItemCount(DawnguardAmulet) > 0)
     Alias_Dawnguard.GetActorRef().RemoveItem(DawnguardAmulet)
     obj = Alias_Dawnguard.GetActorRef().PlaceAtMe(DawnguardAmulet)
     obj.MoveTo(obj, 0, 0, 15)
EndIf
if (Alias_Dawnguard.GetActorRef().GetItemCount(DLC1_WESC06Orders) > 0)
     Alias_Dawnguard.GetActorRef().RemoveItem(DLC1_WESC06Orders)
     obj = Alias_Dawnguard.GetActorRef().PlaceAtMe(DLC1_WESC06Orders)
     obj.MoveTo(obj, 0, 0, 25)
EndIf
if (Alias_Dawnguard.GetActorRef().GetItemCount(CacheKey) > 0)
     Alias_Dawnguard.GetActorRef().RemoveItem(CacheKey)
     obj = Alias_Dawnguard.GetActorRef().PlaceAtMe(CacheKey)
     obj.MoveTo(obj, 0, 0, 20)
EndIf
Alias_Dawnguard.GetActorRef().EvaluatePackage()
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
if (!GetStageDone(10))
     Alias_Dawnguard.GetReference().DeleteWhenAble()
EndIf
Alias_Vampire01.GetReference().DeleteWhenAble()
Alias_Vampire02.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Any of the three Vampires are killed.
;Debug.Trace("Stage 20 - Vampire Dead")
if (Alias_Vampire01.GetActorRef().IsDead() && Alias_Vampire02.GetActorRef().IsDead())
     SetStage(30)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Fleeing Dawnguard is killed.
;Debug.Trace("Stage 10 - Dawnguard Dead")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;All three vampires dead. Start Forcegreet if Dawnguard is still alive.
;Debug.Trace("Stage 30 - All Vampires Dead")
Alias_Dawnguard.GetActorRef().EvaluatePackage()
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
;Debug.Trace("Starting Dawnguard")
Utility.Wait(5)
;Debug.Trace("Starting Vampires")
Alias_Vampire01.GetReference().Enable()
Alias_Vampire02.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DLC1DawnguardFaction  Auto  

Armor Property ReplacementClothes  Auto  

Book Property DLC1_WESC06Orders  Auto  

Armor Property DawnguardAmulet  Auto  

Key Property CacheKey  Auto  

Armor Property DLC1ArmorDawnguardBody1  Auto  
