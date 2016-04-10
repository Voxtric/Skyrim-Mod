;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname DLC2_QF_DLC2MH02_0201A50C Extends Quest Hidden

;BEGIN ALIAS PROPERTY RieklingAlly01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAlly01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Chief
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Chief Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAlly08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAlly08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAlly02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAlly02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAlly04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAlly04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BristlebackPen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BristlebackPen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nord2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nord2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nord7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nord7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAlly05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAlly05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExileCamp
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExileCamp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nord3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nord3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BilgemuckSpawnPoint
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BilgemuckSpawnPoint Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nord6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nord6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ChiefEssential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ChiefEssential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nord1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nord1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thirsk
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Thirsk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nord4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nord4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAlly06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAlly06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bilgemuck
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bilgemuck Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAlly03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAlly03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nord5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nord5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAlly09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAlly09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RieklingAlly07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RieklingAlly07 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(37)
SetObjectiveDisplayed(40)

Alias_ChiefEssential.Clear()
Alias_Chief.GetActorRef().RemoveFromFaction(RieklingFaction)
Alias_Chief.GetActorRef().AddToFaction(SpecialCombat)
Alias_Chief.GetActorRef().SetAV("aggression", 2)
Game.GetPlayer().AddToFaction(SpecialCombat)
Alias_Chief.GetActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; shut down because player is assaulting the hall with the Thirsk Nords

if (GetStageDone(10))
   SetStage(210)
else
    CampMarker.Enable()
    Game.GetPlayer().RemoveFromFaction(SpecialCombat)
    DLC2MHBlockPillarWork.Value = 0
    Stop()
endif

DanceEnabler.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted(40)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
FailAllObjectives()
CampMarker.Enable()
Game.GetPlayer().RemoveFromFaction(SpecialCombat)
DLC2MHBlockPillarWork.Value = 0
DanceEnabler.Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(17)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

CampMarker.AddToMap()
DanceEnabler.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
DLC2MHBlockPillarWork.Value = 1

SetObjectiveCompleted(10)
setObjectiveDisplayed(15)

Alias_Bilgemuck.GetActorReference().AllowPCDialogue(false)
Alias_Bilgemuck.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(35)
SetObjectiveDisplayed(37)

Alias_Chief.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; shut down because we are awesome

;WorshipScene.Start()

PostQuest.Start()

CampMarker.Enable()

AchievementsQuest.IncSideQuests()
Game.GetPlayer().RemoveFromFaction(SpecialCombat)
DLC2MHBlockPillarWork.Value = 0
Stop() ; quest stops when scene ends
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN AUTOCAST TYPE dlc2mh02questscript
Quest __temp = self as Quest
dlc2mh02questscript kmyQuest = __temp as dlc2mh02questscript
;END AUTOCAST
;BEGIN CODE
Alias_Chief.GetActorRef().EvaluatePackage()

ThirskFaction.SetEnemy(RieklingFaction)
RieklingFaction.SetEnemy(ThirskFaction) ; this *should* be unnecessary...
RieklingFaction.SetAlly(PlayerFaction)

Alias_Nord1.GetActorReference().SetActorValue("aggression", 2)
Alias_Nord2.GetActorReference().SetActorValue("aggression", 2)
Alias_Nord3.GetActorReference().SetActorValue("aggression", 2)
Alias_Nord4.GetActorReference().SetActorValue("aggression", 2)
Alias_Nord5.GetActorReference().SetActorValue("aggression", 2)
if (DLC2MQ06.IsCompleted())
    Alias_Nord6.GetActorReference().SetActorValue("aggression", 2)
    Alias_Nord7.GetActorReference().SetActorValue("aggression", 2)
endif

Alias_Nord1.GetActorReference().SetActorValue("confidence", 4)
Alias_Nord2.GetActorReference().SetActorValue("confidence", 4)
Alias_Nord3.GetActorReference().SetActorValue("confidence", 4)
Alias_Nord4.GetActorReference().SetActorValue("confidence", 4)
Alias_Nord5.GetActorReference().SetActorValue("confidence", 4)
if (DLC2MQ06.IsCompleted())
    Alias_Nord6.GetActorReference().SetActorValue("confidence", 4)
    Alias_Nord7.GetActorReference().SetActorValue("confidence", 4)
endif

Alias_Nord1.GetActorReference().GetActorBase().SetProtected(false)
Alias_Nord2.GetActorReference().GetActorBase().SetProtected(false)
Alias_Nord3.GetActorReference().GetActorBase().SetProtected(false)
Alias_Nord4.GetActorReference().GetActorBase().SetProtected(false)
Alias_Nord5.GetActorReference().GetActorBase().SetProtected(false)
if (DLC2MQ06.IsCompleted())
    Alias_Nord6.GetActorReference().GetActorBase().SetProtected(false)
    Alias_Nord7.GetActorReference().GetActorBase().SetProtected(false)
endif

if (!DLC2MQ06.IsCompleted())
;     Debug.Trace("DLC2MH02: Main quest not completed; leave temple builders alone.")
    Alias_Nord6.Clear()
    Alias_Nord7.Clear()
    ModObjectiveGlobal(-2, kmyQuest.NordsAlive)
    ModObjectiveGlobal(-2, kmyQuest.NordsTotal)
else
;     Debug.Trace("DLC2MH02: Main quest completed; make sure builders are in place.")
    Alias_Nord6.GetRef().MoveTo(CampMarker)
    Alias_Nord7.GetRef().MoveTo(CampMarker)
endif

SetObjectiveCompleted(20)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(35)

DLC2MH01.SetStage(205)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE dlc2mh02questscript
Quest __temp = self as Quest
dlc2mh02questscript kmyQuest = __temp as dlc2mh02questscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.BilgemuckFollow = false
Alias_Bilgemuck.GetActorRef().EvaluatePackage()

SetObjectiveCompleted(15)
SetObjectiveDisplayed(17)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)

Alias_Bilgemuck.GetActorReference().Enable()
Alias_Bilgemuck.GetActorReference().AllowPCDialogue(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2MH01  Auto  

Quest Property PostQuest  Auto  

Faction Property ThirskFaction  Auto  

Faction Property RieklingFaction  Auto  

ObjectReference Property CampMarker  Auto  

Faction Property PlayerFaction  Auto  

Quest Property DLC2MQ06  Auto  

achievementsscript Property AchievementsQuest  Auto  

Faction Property SpecialCombat  Auto  

GlobalVariable Property DLC2MHBlockPillarWork  Auto  

Scene Property WorshipScene  Auto  

ObjectReference Property DanceEnabler  Auto  
