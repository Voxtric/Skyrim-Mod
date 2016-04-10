;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname DLC2_QF_DLC2MH01_0201A50B Extends Quest Hidden

;BEGIN ALIAS PROPERTY HrothmundInYourHead
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HrothmundInYourHead Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking012 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BujoldEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BujoldEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hilund
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hilund Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thirsk
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Thirsk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking020
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking020 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThirskCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThirskCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sirkjorg
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sirkjorg Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bujold
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bujold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking019
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking019 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking015 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BarrowMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BarrowMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Kuvar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Kuvar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Halbarn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Halbarn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Rielking006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Rielking006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Herkja
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Herkja Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Altar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Altar Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Elmus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Elmus Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(40)


SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(30)
setObjectiveDisplayed(40)

Alias_BujoldEssential.Clear()
Alias_Bujold.GetActorRef().RemoveFromFaction(ThirskFaction)
Alias_Bujold.GetActorRef().AddToFaction(HateFaction)
Alias_Bujold.GetActorRef().StartCombat(Game.GetPlayer())
Alias_Bujold.GetActorRef().SetAV("aggression", 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DLC2MH01QuestScript
Quest __temp = self as Quest
DLC2MH01QuestScript kmyQuest = __temp as DLC2MH01QuestScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(27)
SetObjectiveDisplayed(30)

DLC2ThirskRieklingOwned.SetValueInt(0)

kmyquest.CleanupRieklings()
DLC2MHBlockPillarWork.Value = 0
NordClutterMarker.Enable()
RieklingClutterMarker.Disable()
AshfireChanceNone.Value = 0
WIFunctions.AllowComplexInteractions(Alias_Thirsk.GetLocation())

DLC2ThirskFFElmusBack.Start()
DLC2ThirskFFHilund.Start()
DLC2ThirskFFHalbarn.Start()
Alias_Kuvar.GetActorRef().SetFactionRank(JobTrainerFaction, 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; shut down because we're assualting the camp with the Rieklings

if (GetStageDone(10) || GetStageDone(20))
   SetStage(210)
else
   Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)

ThirskMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
setObjectiveCompleted(25)
SetObjectiveDisplayed(27)

Alias_Bujold.GetActorRef().EvaluatePackage()

BarrowMapMarker.AddToMap()
(BarrowRefillTrigger as DLC2HrothmundsBarrowWaterSCRIPT).bStopMovingWaterUp = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE DLC2MH01QuestScript
Quest __temp = self as Quest
DLC2MH01QuestScript kmyQuest = __temp as DLC2MH01QuestScript
;END AUTOCAST
;BEGIN CODE
DLC2MHBlockPillarWork.Value = 1

if (IsObjectiveDisplayed(10))
    SetObjectiveCompleted(10)
endif
SetObjectiveDisplayed(20)

Game.GetPlayer().AddToFaction(ThirskFaction)
ThirskFaction.SetEnemy(RieklingFaction)

Alias_Bujold.GetActorRef().EvaluatePackage()
Alias_Elmus.GetActorRef().EvaluatePackage()
Alias_Halbarn.GetActorRef().EvaluatePackage()
Alias_Hilund.GetActorRef().EvaluatePackage()
Alias_Kuvar.GetActorRef().EvaluatePackage()
Alias_Sirkjorg.GetActorRef().EvaluatePackage()
Alias_Herkja.GetActorRef().EvaluatePackage()

kmyQuest.SpawnRieklings()

if (DLC2MH02.IsRunning())
     DLC2MH02.SetStage(205)
endif

if (DLC2ThirskFFElmus.IsRunning())
    DLC2ThirskFFElmus.SetStage(210)
endif

if (IntroScene.IsPlaying())
    IntroScene.Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
CompleteAllObjectives()

PostQuest.Start()


AchievementsQuest.IncSideQuests()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
WIFunctions.DisallowComplexInteractions(Alias_Thirsk.GetLocation())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
CompleteAllObjectives()

PostQuest.Start()


AchievementsQuest.IncSideQuests()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(21)
SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property HateFaction  Auto  

Faction Property ThirskFaction  Auto  

GlobalVariable Property DLC2ThirskRieklingOwned  Auto  

Quest Property PostQuest  Auto  

Quest Property DLC2MH02  Auto  

Faction Property RieklingFaction  Auto  

ObjectReference Property ThirskMarker  Auto  

Quest Property DLC2ThirskFFElmus  Auto  

Quest Property DLC2ThirskFFElmusBack  Auto  

Quest Property DLC2ThirskFFHilund  Auto  

Quest Property DLC2ThirskFFHalbarn  Auto  

achievementsscript Property AchievementsQuest  Auto  

Scene Property introScene  Auto  

WIFunctionsScript Property WIFunctions  Auto  

ObjectReference Property RieklingClutterMarker  Auto  

ObjectReference Property NordClutterMarker  Auto  

GlobalVariable Property DLC2MHBlockPillarWork  Auto  

ObjectReference Property BarrowMapMarker  Auto  

GlobalVariable Property AshfireChanceNone  Auto  

ObjectReference Property BarrowRefillTrigger  Auto  

Faction Property JobTrainerFaction  Auto  
