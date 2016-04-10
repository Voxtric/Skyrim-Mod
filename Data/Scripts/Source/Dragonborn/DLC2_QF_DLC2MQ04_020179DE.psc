;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 60
Scriptname DLC2_QF_DLC2MQ04_020179DE Extends Quest Hidden

;BEGIN ALIAS PROPERTY SkaalCitizenBaldor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenBaldor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenNikulas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenNikulas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenFanari
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenFanari Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HermaeusMoraSkaal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HermaeusMoraSkaal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nchardak
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Nchardak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenAeta
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenAeta Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenEdla
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenEdla Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenTharstan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenTharstan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenDeor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenDeor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Storn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Storn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HermaeusMora
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HermaeusMora Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenWulf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenWulf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenYrsa
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenYrsa Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenMorwen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenMorwen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book2Tamriel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book2Tamriel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenOslaf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenOslaf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book2Apocrypha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book2Apocrypha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkaalCitizenFinna
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkaalCitizenFinna Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE DLC2MQ05Script
Quest __temp = self as Quest
DLC2MQ05Script kmyQuest = __temp as DLC2MQ05Script
;END AUTOCAST
;BEGIN CODE
; HM disappears
kmyQuest.EnableHMStorn(false)
; TEMP?
;Alias_Storn.GetActorRef().Kill()
; TEMP - advance to 1000
setstage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
; player talks to Frea about secrets
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; HM forcegreets again
Alias_HermaeusMora.GetRef().Activate(Game.GetPlayer())
Game.EnablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; player talks to Neloth after getting Storn objective
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; quickstart
DLC2MQ04.SetStage(0)
DLC2MQ04.SetStage(50) ; Nchardak map marker
DLC2MQ04.SetStage(100) ; arrival scene
DLC2MQ04.SetStage(120) ; put cube in exterior door
DLC2MQ04.SetStage(150) ; put cube in exterior door
DLC2MQ04.SetStage(210) ; put cube in exterior door
DLC2MQ04.SetStage(500)
;DLC2MQ04.SetStage(550)
DLC2MQ04.SetStage(1) ; quickstart - stop all MQ04 scenes
Alias_Neloth.GetRef().MoveTo(Alias_Book2Tamriel.GetRef())
;Alias_Book2Tamriel.GetRef().Enable()
Game.TeachWord(DLC2BendToWillWord1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; player talks to Storn, Storn asks for Book 2
DLC2MQ05SkaalSceneIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; player talks to Neloth before finishing Apocrypha
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN AUTOCAST TYPE DLC2MQ05Script
Quest __temp = self as Quest
DLC2MQ05Script kmyQuest = __temp as DLC2MQ05Script
;END AUTOCAST
;BEGIN CODE
; more HM
kmyQuest.EnableHMStorn(true, 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; dragon is dead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
; player leaves Nchardak after talking to HM
DLC2MQ05NchardakReadBookScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN AUTOCAST TYPE DLC2MQ05Script
Quest __temp = self as Quest
DLC2MQ05Script kmyQuest = __temp as DLC2MQ05Script
;END AUTOCAST
;BEGIN CODE
; HM appears
kmyQuest.EnableHMStorn(true, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player exits Nchardak interior after reading book
; make sure MQ04 scene is done
DLC2MQ04NchardakEndScene.Stop()
DLC2MQ05NchardakReadBookScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
Alias_Storn.GetActorRef().Kill()
Alias_Storn.GetActorRef().RemoveItem(DLC2WordBurnedInChest)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
; Hermaeus Mora says he wants Skaal's secrets
SetObjectiveCompleted(20) ; learn hidden knowledge
SetObjectiveDisplayed(30) ; talk to Storn
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
; clean up Storn's body, stop quest (set by MQ06)
Alias_Storn.GetRef().RemoveAllItems(Alias_Frea.GetRef(), false, true)
Alias_Storn.GetRef().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
CompleteAllObjectives()
; start MQ06
DLC2MQ06.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE DLC2MQ05Script
Quest __temp = self as Quest
DLC2MQ05Script kmyQuest = __temp as DLC2MQ05Script
;END AUTOCAST
;BEGIN CODE
; player gets to end of Book 2 dungeon
; open book:
(Alias_Book2Apocrypha.GetRef() as DLC2ApocryphaBookRewardScript).OpenBook()
; Hermaeus Mora appears
kmyQuest.EnableHM(true)
DLC2MQ05HermaeusMoraScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
; player returns from Apocrypha
; clean up MQ04
DLC2MQ04.SetStage(600)
; enable dragon
DLC2dunNchardak.SetStage(300)
; evp Neloth
Alias_Neloth.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
; first part of conversation done - scene proceeds
; disable player controls for duration
Game.DisablePlayerControls()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
; player talks to Storn, gives book to Storn

Alias_Storn.GetRef().AddItem(Alias_Book2Tamriel.GetRef())
SetObjectiveCompleted(30) ; talk to Storn
SetObjectiveDisplayed(40) ; wait for Storn to read
; fill citizen aliases
DLC2MQ05SkaalSceneFiller.Start()
;while DLC2MQ05SkaalSceneFiller.IsRunning() == false
;  debug.trace(self + "waiting for DLC2MQ05SkaalSceneFiller to start")
;  utility.wait(1)
;endWhile
;DLC2MQ05SkaalSceneFiller.Stop()
DLC2MQ05SkaalScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
; player tells Storn that HM wants secrets
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
; HM "forcegreets"
Alias_HermaeusMora.GetRef().Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; start quest
SetObjectiveDisplayed(10)
SetActive(true)
DLC2MQ05NchardakReadBookScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE DLC2MQ05Script
Quest __temp = self as Quest
DLC2MQ05Script kmyQuest = __temp as DLC2MQ05Script
;END AUTOCAST
;BEGIN CODE
; finished talking to HM
; failsafe:
setstage(340)
setstage(325)
; HM disappears
kmyQuest.EnableHM(false)
; give player one of the Book02 rewards
;(Alias_Book2Apocrypha.GetRef() as DLC2ApocryphaBookRewardScript).SetPower((Alias_Book2Apocrypha.GetRef() as DLC2ApocryphaBookRewardScript).RewardActivator01)
; show "To Solstheim" on book:
;(Alias_Book2Apocrypha.GetRef() as DLC2ApocryphaBookRewardScript).EnableToSolstheimActivator()
; NOPE - just make book act normally now:
; reset Book02 to work normally
(Alias_Book2Apocrypha.GetReference() as DLC2ApocryphaBookRewardScript).requireRewardsShownToMove = True
(Alias_Book2Apocrypha.GetReference() as DLC2ApocryphaBookRewardScript).showRewardsOnActivation = True
;(Alias_Book2Apocrypha.GetReference() as DLC2ApocryphaBookRewardScript).DisableToSolstheimActivator()
(Alias_Book2Apocrypha.GetReference() as DLC2ApocryphaBookRewardScript).ShowRewards()
DLC2BookDungeonController.IncrementBookFinished()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; player has read book
SetObjectiveCompleted(10) ; read book
SetObjectiveDisplayed(20) ; find hidden knowledge
; if player is not in Apocrypha (exited quickly), set stage 150
if Game.GetPlayer().IsInLocation(DLC2ApocryphaLocation) == false
	setStage(150)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN AUTOCAST TYPE DLC2MQ05Script
Quest __temp = self as Quest
DLC2MQ05Script kmyQuest = __temp as DLC2MQ05Script
;END AUTOCAST
;BEGIN CODE
; more HM
kmyQuest.EnableHMStorn(true, 7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
; teach Word 2
Game.TeachWord(DLC2BendToWillWord2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
; start Storn death sequence
; Storn dies
Alias_Storn.GetActorRef().GetActorBase().SetEssential(false)
Alias_Storn.GetActorRef().PlaySubgraphAnimation("StopEffect")
Alias_Storn.GetActorRef().PlaySubgraphAnimation("stage3")
Alias_Storn.GetActorRef().PlayIdle(IdleDLC02TentacleWordBurnExit)
; teach Word 3
Game.TeachWord(DLC2BendToWillWord3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE DLC2MQ05Script
Quest __temp = self as Quest
DLC2MQ05Script kmyQuest = __temp as DLC2MQ05Script
;END AUTOCAST
;BEGIN CODE
; tentacles appear
actor storn = Alias_Storn.GetActorRef()
storn.IgnoreFriendlyHits(true)
storn.SetGhost(true)
storn.StopCombatAlarm()
storn.PlayIdle(IdleDLC02TentacleWordBurnBegin)
storn.EquipItem(DLC2WordBurnedInChest)
storn.PlaySubgraphAnimation("stage2")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;TEMP: 'Resets' Apocrypha Book 2 to use the standard reward system.
(Alias_Book2Apocrypha.GetReference() as DLC2ApocryphaBookRewardScript).requireRewardsShownToMove = True
(Alias_Book2Apocrypha.GetReference() as DLC2ApocryphaBookRewardScript).showRewardsOnActivation = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
; player exits Apocrypha after talking to HM
; failsafe:
SetStage(350)
; evp Neloth
Alias_Neloth.GetActorRef().EvaluatePackage()
; dismiss Frea if a follower
if Alias_Frea.GetActorRef().IsInFaction(CurrentFollowerFaction)
	DialogueFollower.DismissFollower()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2MQ05  Auto  

Quest Property DLC2MQ03  Auto  

Quest Property DLC2MQ04  Auto  

Quest Property DLC2MQ06  Auto  

WordOfPower Property DLC2BendToWillWord3  Auto  

WordOfPower Property DLC2BendToWillWord2  Auto  

Scene Property DLC2MQ05NchardakReadBookScene  Auto  

Quest Property DLC2dunNchardak  Auto  

Scene Property DLC2MQ04NchardakEndScene  Auto  

Scene Property DLC2MQ05HermaeusMoraScene  Auto  

Scene Property DLC2MQ05SkaalScene  Auto  

WordOfPower Property DLC2BendToWillWord1  Auto  

Scene Property DLC2MQ05SkaalSceneIntro  Auto  

Quest Property DLC2MQ05SkaalSceneFiller  Auto  
{start quest to fill Skaal Citizen aliases}

DialogueFollowerScript Property DialogueFollower  Auto  
{follower quest - to dismiss Frea}

Faction Property CurrentFollowerFaction  Auto  

Location Property DLC2ApocryphaLocation  Auto  

Armor Property DLC2WordBurnedInChest  Auto  

Idle Property IdleDLC02TentacleWordBurnExit  Auto  

DLC2BookDungeonControllerScript Property DLC2BookDungeonController  Auto  



ObjectReference Property DLC2MQ05StornTentacleMarker  Auto  

Idle Property IdleDLC02TentacleWordBurnBegin  Auto  

Idle Property idleFreaReactionStart  Auto  
