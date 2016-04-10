;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 36
Scriptname DLC1_QF_DLC1VQ03Vampire_01004C3D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Spectator7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonBridge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonBridge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ForbearsHoldout
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_ForbearsHoldout Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dexion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dexion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vanik
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vanik Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Serana
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Serana Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Urag
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Urag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SorexVinius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SorexVinius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hulda
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hulda Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CorpulusVinius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CorpulusVinius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Harkon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Harkon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BarrierWidget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BarrierWidget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadVampire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadVampire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampiresNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampiresNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DawnguardLieutenant
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DawnguardLieutenant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MalkusCorpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MalkusCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BarrierControl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BarrierControl Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Harkon's speech is over, player must locate a moth priest. Serana will now forcegreet.
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(23,1)
SetObjectiveDisplayed(24,1)
SetObjectiveDisplayed(26,1)

;Start the reaction scene
DLC1VQ03VampireSpeechReactionScene.Start()

;Enable wagon and driver
DLC1VQ03RoadsideDestroyed.Enable()

;Open Forbears' Holdout cave entrance
DLC1VQ03DoorEnableMarker.Enable()

(RNPCDialogueQuest as DLC1VQ03RNPCQuestScript).LookingForMothPriest = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Moth priest broken, command him to read the scroll
;Update objectives
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE DLC1VQ03MothpriestFightScript
Quest __temp = self as Quest
DLC1VQ03MothpriestFightScript kmyQuest = __temp as DLC1VQ03MothpriestFightScript
;END AUTOCAST
;BEGIN CODE
;Enthralled moth priest defeated, player must now charm and enthrall
SetObjectiveCompleted(45)
SetObjectiveDisplayed(47)

;Alias_Dexion.GetActorRef().RemoveFromFaction(CrimeFactionHaafingar)

Game.GetPlayer().AddToFaction(DLC1DexionThrall)
Alias_Dexion.GetActorRef().StopCombat()

;kmyQuest.ClearNoRecovery()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Harkon's speech is over, player must locate a moth priest. Serana will now forcegreet.
SetObjectiveDisplayed(25,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE DLC1VQ03VampireVariables
Quest __temp = self as Quest
DLC1VQ03VampireVariables kmyQuest = __temp as DLC1VQ03VampireVariables
;END AUTOCAST
;BEGIN CODE
;Player has found carriage and driver along the roadside
;Update Objectives
SetObjectiveCompleted(30,1)

;Display objective 35 if the player has not already picked up the note
if kmyquest.VarBook == 0
SetObjectiveDisplayed(35,1)
endif

;Manage variables
((self as quest) as DLC1VQ03VampireVariables).VarDragonBridge = 1
((self as quest) as DLC1VQ03VampireVariables).VarWagon = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;The player has defeated the moth priest and must use Vampire's Seduction on him

Game.GetPlayer().AddPerk(DLC1VampireFeedDexionVampireSeduction)

SetObjectiveCompleted(39)
SetObjectiveDisplayed(40)

;Here we check if the player is a vampire
if PlayerIsVampire.getValue() == 1
	;If they are not already at stage 2 vampirism, trigger it now!
	if PlayerVampireQuest.VampireStatus < 2
		PlayerVampireQuest.VampireProgression(game.getPlayer(), 2)
	endif
else
	debug.Trace(self + ": Major badness! Player is not a vampire on the vampire side of the questline!")
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Completion stage
SetObjectiveCompleted(80,1)
RNPCDialogueQuest.Stop()
VQ04.SetStage(10)
pDLC1VQElder.SetStage(10)
DLC1VQ03RoadsideDestroyed.Disable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Speak to Harkon
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE DLC1VQ03MothpriestFightScript
Quest __temp = self as Quest
DLC1VQ03MothpriestFightScript kmyQuest = __temp as DLC1VQ03MothpriestFightScript
;END AUTOCAST
;BEGIN CODE
;Go after the moth priest
;Disable draugr in POI dungeon cell
DLC1_VQ03_DraugrParent.Disable()

;Enable moth priest & vigilant guards
Alias_Dexion.TryToEnable()
DLC1VQ03EnablePriestAndVigilants.Enable()
Alias_Dexion.GetActorReference().AllowBleedoutDialogue(true)

;Enable camp POI vigilant guards
DLC1VQ03CampHunters.Enable()

;Add the Forbear's Holdout map marker to the player's world map
DLC1ForbearsHoldoutMapMarkerREF.AddToMap()

;Start Dawnguard scene
DLC1VQ03VampireDawnguardScene.Start()

;Re-enable Spectators 1 & 2 in vampire castle
Alias_Spectator1.GetActorReference().Enable()
Alias_Spectator2.GetActorReference().Enable()

;Manage objectives
SetObjectiveCompleted(23)
SetObjectiveCompleted(24)
SetObjectiveCompleted(25)
SetObjectiveCompleted(26)
SetObjectiveCompleted(28)
SetObjectiveCompleted(30)
SetObjectiveCompleted(35)
SetObjectiveCompleted(37)
SetObjectiveDisplayed(38)

;Manage variables
((self as quest) as DLC1VQ03VampireVariables).VarDragonBridge = 1
((self as quest) as DLC1VQ03VampireVariables).VarWagon = 1
((self as quest) as DLC1VQ03VampireVariables).VarBook = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Stage 10, set up scene elements, Harkon paths to guild hall to make speech
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
DLC1VQ03VampireHarkonSpeechFindScroll.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Serana leaves with moth priest, player is directed to report to Harkon
SetObjectiveCompleted(38,1)
SetObjectiveCompleted(47,1)
SetObjectiveDisplayed(50,1)

;Change Dexion's Factions and set confidence to cowardly
Alias_Dexion.GetActorRef().AddToFaction(DLC1VampireFeedNoCrimeFaction)
Alias_Dexion.GetActorRef().RemoveFromFaction(DLC1DexionThrall)
Alias_Dexion.GetActorRef().RemoveFromFaction(DLC1MothPriestFaction)
Alias_Dexion.GetActorRef().SetActorValue("Confidence", 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Moth priest reads the scroll
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(80,1)
Alias_Dexion.GetActorReference().AllowBleedoutDialogue(false)

;Disable the scroll-reading furniture marker
DLC1VQ03DexionTortureRead.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Debug setup
Alias_Harkon.GetReference().MoveTo(DLC1VQ02HarkonWaitMarker)
Alias_Serana.GetReference().MoveTo(DLC1VQ03Stage20SeranaStandMarker)
;DLC1VQ01.SetStage(200)
;VQ02.SetStage(200)
SetStage(5)
Game.GetPlayer().AddtoFaction(DLC1VampireFaction)
DLC1Radiant.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Player has entered the vampire castle, set up for the torture and reading scenes
Alias_Harkon.GetReference().MoveTo(DLC1VQ02HarkonMeetSerana)
Alias_Dexion.GetReference().MoveTo(DLC1VQ03DexionTortureRead)
Alias_Spectator1.GetReference().MoveTo(DLC1VQ03TortureSpectator1)
Alias_Spectator2.GetReference().MoveTo(DLC1TortureSpectator2)
Alias_Spectator3.GetReference().MoveTo(DLC1VQ03TortureSpectator3)
Alias_Spectator4.GetReference().MoveTo(DLC1VQ03TortureSpectator4)
Alias_Spectator5.GetReference().MoveTo(DLC1VQ03TortureSpectator5)
Alias_Spectator6.GetReference().MoveTo(DLC1VQ03TortureSpectator6)
Alias_Spectator7.GetReference().MoveTo(DLC1VQ03TortureSpectator7)
Alias_Spectator8.GetReference().MoveTo(DLC1VQ03TortureSpectator8)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE DLC1VQ03MothpriestFightScript
Quest __temp = self as Quest
DLC1VQ03MothpriestFightScript kmyQuest = __temp as DLC1VQ03MothpriestFightScript
;END AUTOCAST
;BEGIN CODE
;Dexion seduced, get up for bite

kmyQuest.ClearNoRecovery()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Interrogate the moth priest
;Update objectives
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE DLC1VQ03MothpriestFightScript
Quest __temp = self as Quest
DLC1VQ03MothpriestFightScript kmyQuest = __temp as DLC1VQ03MothpriestFightScript
;END AUTOCAST
;BEGIN CODE
;Player has freed the enthralled moth priest and must fight him.
DLC1VQ03VampireMothPriestScene.Start()
kmyQuest.StartMothPriestFight()
SetObjectiveCompleted(41)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;No longer used
;The player has learned that the moth priest went to Solitude
SetObjectiveCompleted(24,1)
SetObjectiveCompleted(25,1)
SetObjectiveDisplayed(26,1)
SetObjectiveDisplayed(28,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE DLC1VQ03VampireVariables
Quest __temp = self as Quest
DLC1VQ03VampireVariables kmyQuest = __temp as DLC1VQ03VampireVariables
;END AUTOCAST
;BEGIN CODE
;Player is directed to talk to people in Dragon Bridge
SetObjectiveCompleted(24,1)
SetObjectiveCompleted(25,1)
SetObjectiveCompleted(26,1)

;Display objective 30 only if the player has not already talked to people in Dragon Bridge
if kmyquest.VarDragonbridge == 0
SetObjectiveDisplayed(28,1)
endif

;Add the Dragon Bridge map marker to the player's world map
DragonBridgeMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN AUTOCAST TYPE DLC1VQ03MothpriestFightScript
Quest __temp = self as Quest
DLC1VQ03MothpriestFightScript kmyQuest = __temp as DLC1VQ03MothpriestFightScript
;END AUTOCAST
;BEGIN CODE
;Player has lowered the magic barrier and freed the moth priest
SetObjectiveCompleted(41)

;Add fx shader and any other fight set up to the mothpriest
kmyQuest.StartUp()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE DLC1VQ03MothpriestFightScript
Quest __temp = self as Quest
DLC1VQ03MothpriestFightScript kmyQuest = __temp as DLC1VQ03MothpriestFightScript
;END AUTOCAST
;BEGIN CODE
;The moth priest has finished playing his scene and goes into combat with the player

if GetStageDone(67) == False
SetObjectiveDisplayed(39)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE DLC1VQ03VampireVariables
Quest __temp = self as Quest
DLC1VQ03VampireVariables kmyQuest = __temp as DLC1VQ03VampireVariables
;END AUTOCAST
;BEGIN CODE
;Search the road south of Solitude

;Manage objectives
SetObjectiveCompleted(28,1)

;Display objective 30 if player has not already investigated the scene of the wreckage
if kmyquest.VarWagon == 0
SetObjectiveDisplayed(30)
endif

;Manage variables
((self as quest) as DLC1VQ03VampireVariables).VarDragonBridge = 1

(RNPCDialogueQuest as DLC1VQ03RNPCQuestScript).LookingForMothPriest = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN AUTOCAST TYPE DLC1VQ03VampireVariables
Quest __temp = self as Quest
DLC1VQ03VampireVariables kmyQuest = __temp as DLC1VQ03VampireVariables
;END AUTOCAST
;BEGIN CODE
;Player has picked up the note form the dead soldier's body and now has it in inventory

;Display objective 37 if the player has not already picked up the book
if kmyquest.VarBook == 0
SetObjectiveDisplayed(37,1)
endif

;Manage variables
((self as quest) as DLC1VQ03VampireVariables).VarDragonBridge = 1
((self as quest) as DLC1VQ03VampireVariables).VarWagon = 1
((self as quest) as DLC1VQ03VampireVariables).VarBook = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;No longer used
;The player has learned about the moth priest being sighted at the Winking Skeever in Solitude
SetObjectiveCompleted(25,1)
SetObjectiveDisplayed(27,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE DLC1VQ03MothpriestFightScript
Quest __temp = self as Quest
DLC1VQ03MothpriestFightScript kmyQuest = __temp as DLC1VQ03MothpriestFightScript
;END AUTOCAST
;BEGIN CODE
;Startup Stage
SetObjectiveDisplayed(10,1)

; start up Serana's dialogue quest
RNPCDialogueQuest.Start()

;Add fx shader and any other fight set up to the mothpriest
kmyQuest.StartUp()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property HallNormal  Auto  

ObjectReference Property HallRuined  Auto  

ReferenceAlias Property Serana  Auto  

ObjectReference Property StandMarker  Auto  

ReferenceAlias Property Sarcophagus  Auto  

Quest Property VQ02  Auto  

ObjectReference Property OpenDungeon  Auto  

Quest Property VQ04  Auto  

ObjectReference Property DLC1VQ03EnablePriestAndVigilants  Auto  

ObjectReference Property DLC1VQ03RoadsideIntact  Auto  

ObjectReference Property SeranaRef  Auto  

Quest Property DialogueFollower  Auto  

ObjectReference Property DLC1VQ02HarkonMeetSerana  Auto  

ObjectReference Property DLC1VQ03SeranaTortureSceneStand  Auto  

ObjectReference Property DLC1VQ03DexionTortureRead  Auto  

ObjectReference Property DLC1VQ03TortureSpectator1  Auto  

ObjectReference Property DLC1TortureSpectator2  Auto  

ObjectReference Property DLC1VQ03TortureSpectator3  Auto  

ObjectReference Property DLC1VQ03TortureSpectator4  Auto  

ObjectReference Property DLC1VQ03TortureSpectator5  Auto  

ObjectReference Property DLC1VQ03TortureSpectator6  Auto  

ObjectReference Property DLC1VQ03TortureSpectator7  Auto  

ObjectReference Property DLC1VQ03TortureSpectator8  Auto  

ObjectReference Property DLC1VQ02HarkonWaitMarker  Auto  

ObjectReference Property DLC1VQ03Stage20SeranaStandMarker  Auto  

Scene Property DLC1VQ03VampireHarkonSpeechFindScroll  Auto  

ObjectReference Property DLC1_VQ03_DraugrParent  Auto  

ObjectReference Property DLC1VQ03CampHunters  Auto  

DLC1_NPCMentalModelScript Property MM Auto

Quest Property RNPCDialogueQuest  Auto  

Quest Property pDLC1VQElder  Auto 

Quest Property DLC1VQ01  Auto  

Faction Property DLC1DexionThrall  Auto  

Faction Property CrimeFactionHaafingar  Auto  

ObjectReference Property DLC1VQ03RoadsideDestroyed  Auto  

Scene Property DLC1VQ03VampireDawnguardScene  Auto  

ObjectReference Property DLC1VQ03DoorEnableMarker  Auto  

Scene Property DLC1VQ03VampireMothPriestScene  Auto  

Faction Property DLC1VampireFaction  Auto  

Quest Property DLC1Radiant  Auto  

Perk Property DLC1VampireFeedDexionVampireSeduction  Auto  

PlayerVampireQuestScript property PlayerVampireQuest auto

GlobalVariable property PlayerIsVampire auto

Scene Property DLC1VQ03VampireSpeechReactionScene  Auto  

ObjectReference Property DragonBridgeMapMarker  Auto 
ObjectReference Property DLC1ForbearsHoldoutMapMarkerREF  Auto

Faction Property DLC1VampireCrimeFaction  Auto

Faction Property DLC1MothPriestFaction  Auto  

Faction Property DLC1VampireFeedNoCrimeFaction  Auto  
