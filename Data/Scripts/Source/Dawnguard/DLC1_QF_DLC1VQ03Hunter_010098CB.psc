;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 33
Scriptname DLC1_QF_DLC1VQ03Hunter_010098CB Extends Quest Hidden

;BEGIN ALIAS PROPERTY Serana
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Serana Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1ForbearsHoldoutLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC1ForbearsHoldoutLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Isran
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Isran Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DeadVampire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DeadVampire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireLeutenant
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampireLeutenant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BarrierControl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BarrierControl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonBridge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonBridge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Innkeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Innkeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampiresNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampiresNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Malkus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Malkus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CorpulusVinius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CorpulusVinius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SorexVinius
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SorexVinius Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dexion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dexion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hulda
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Hulda Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Urag
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Urag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BarrierWidget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BarrierWidget Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE DLC1VQ03MothpriestFightScript
Quest __temp = self as Quest
DLC1VQ03MothpriestFightScript kmyQuest = __temp as DLC1VQ03MothpriestFightScript
;END AUTOCAST
;BEGIN CODE
;The Moth Priest has finished his scene and starts combat with the player

if GetStageDone(67) == False
SetObjectiveDisplayed(42)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE DLC1VQ03MothpriestFightScript
Quest __temp = self as Quest
DLC1VQ03MothpriestFightScript kmyQuest = __temp as DLC1VQ03MothpriestFightScript
;END AUTOCAST
;BEGIN CODE
;Player has placed the Weystone into the pedastal
SetObjectiveCompleted(41)

;Add fx shader and any other fight set up to the mothpriest
kmyQuest.StartUp()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Completion stage
Alias_Dexion.GetActorRef().UnEquipItem(ElderScrollHandAttachArmor3rdP, true)
DLC1VQ03HunterStage90DexionStand.Disable()
SetObjectiveCompleted(60,1)
RNPCDialogueQuest.Stop()
VQ04.SetStage(10)
pDLC1VQElder.SetStage(10)
DLC1VQ03RoadsideDestroyed.Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;The player has learned that the moth priest went to Solitude
SetObjectiveCompleted(24,1)
SetObjectiveCompleted(25,1)
SetObjectiveDisplayed(26,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;Mothpriest has been put into bleedout and fight is over
DLC1VQ03HunterRecoveryScene.Start()
SetObjectiveCompleted(42)
SetStage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN AUTOCAST TYPE DLC1VQ03HunterVariables
Quest __temp = self as Quest
DLC1VQ03HunterVariables kmyQuest = __temp as DLC1VQ03HunterVariables
;END AUTOCAST
;BEGIN CODE
;Player has talked to people in Dragon Bridge and learned about the moth priest sighting
SetObjectiveCompleted(30,1)

;Display objective 32 if player has not already investigated the scene of the wreckage
if kmyquest.VarWagon == 0
SetObjectiveDisplayed(32,1)
endif

DLC1HunterHQEXTInitEnabled03.Disable()

;Manage variables
((self as quest) as DLC1VQ03HunterVariables).VarDragonBridge = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Time to find a moth priest. Serana becomes the player's follower.
SetObjectiveDisplayed(25,1)
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
;Startup Stage - Set objective and move Serana to her start marker
SetObjectiveDisplayed(5,1)
Alias_Serana.GetReference().MoveTo(DLC1VQ03HunterSeranaStart)

; start up Serana's dialogue quest
RNPCDialogueQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Moth priest has been resuced and will head for Fort Dawnguard. Player is directed to report to Isran
SetObjectiveCompleted(40)
SetObjectiveCompleted(45)
SetObjectiveDisplayed(50)

;Change Dexion's active crime faction to The Rift crime faction to match the Dawnguard
Alias_Dexion.GetActorRef().SetCrimeFaction(CrimeFactionRift)
Alias_Dexion.GetActorRef().RemoveFromFaction(CrimeFactionHaafingar)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN AUTOCAST TYPE DLC1VQ03HunterVariables
Quest __temp = self as Quest
DLC1VQ03HunterVariables kmyQuest = __temp as DLC1VQ03HunterVariables
;END AUTOCAST
;BEGIN CODE
;Player has picked up the note from the dead soldier's body and now has it in inventory

;Display objective 37 if the player has not already picked up the book
if kmyquest.VarBook == 0
SetObjectiveDisplayed(37,1)
endif

;Manage variables
((self as quest) as DLC1VQ03HunterVariables).VarDragonBridge = 1
((self as quest) as DLC1VQ03HunterVariables).VarWagon = 1
((self as quest) as DLC1VQ03HunterVariables).VarBook = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE DLC1VQ03HunterVariables
Quest __temp = self as Quest
DLC1VQ03HunterVariables kmyQuest = __temp as DLC1VQ03HunterVariables
;END AUTOCAST
;BEGIN CODE
;Player has found wrecked wagon and wounded soldier along the roadside

;Update Objectives
SetObjectiveCompleted(32,1)

;Display objecrtive 35 if the player has not already picked up the note
if kmyquest.VarBook == 0
SetObjectiveDisplayed(35,1)
endif

;Manage variables
((self as quest) as DLC1VQ03HunterVariables).VarDragonBridge = 1
((self as quest) as DLC1VQ03HunterVariables).VarWagon = 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Stage 17 is a mini-stage that controls scene behaviors
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
;Player has freed enthralled moth priest and must fight him.
DLC1VQ03HunterMothPriestScene.Start()
kmyQuest.StartMothPriestFight()
SetObjectiveCompleted(41)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;The player has learned about the moth priest being sighted at the Winking Skeever in Solitude
SetObjectiveCompleted(25,1)
SetObjectiveDisplayed(27,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player is directed to speak to speak to Isran
SetObjectiveCompleted(10,1)
SetObjectiveCompleted(5,1)
SetObjectiveDisplayed(15,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE DLC1VQ03HunterVariables
Quest __temp = self as Quest
DLC1VQ03HunterVariables kmyQuest = __temp as DLC1VQ03HunterVariables
;END AUTOCAST
;BEGIN CODE
;The player has been told to talk to the people in Dragon Bridge
SetObjectiveCompleted(24,1)
SetObjectiveCompleted(25,1)
SetObjectiveCompleted(26,1)

;Display objective 30 only if the player has not already talked to people in Dragon Bridge
if kmyquest.VarDragonbridge == 0
SetObjectiveDisplayed(30,1)
endif

;Add the Dragon Bridge map marker to the player's world map
DragonBridgeMapMarker.AddToMap()

(RNPCDialogueQuest as DLC1VQ03RNPCQuestScript).LookingForMothPriest = false
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;Player is directed to speak to Serana
SetObjectiveCompleted(5,1)
SetObjectiveDisplayed(10,1)
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
;Player has defeated the enthralled moth priest and can now speak to him
;SetObjectiveCompleted(42)
SetObjectiveDisplayed(45)

kmyQuest.ClearNoRecovery()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Stage 15 is a mini-stage that enables Serana's forcegreet package to tell the player that she has the elder scroll
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Debug setup
Alias_Serana.GetReference().MoveTo(DLC1VQ03HunterSeranaStart)
Alias_Isran.GetReference().MoveTo(DLC1VQ03HunterIsranStand)
game.getPlayer().addToFaction(DLC1HunterFaction)
DLC1VQ01.SetStage(200)
DLC1VQ02.SetStage(200)
DLC1HunterBaseIntro.SetStage(200)
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Player has entered the vampire castle, move Dexion into place if 3D not loaded
if (!Alias_Dexion.GetReference().Is3DLoaded())
Alias_Dexion.GetReference().MoveTo(DLC1VQ03St90DexionMoveTo)
endif

;Player has entered the vampire castle, move Serana into place if 3D not loaded
if (!Alias_Serana.GetReference().Is3DLoaded())
Alias_Serana.GetReference().MoveTo(DLC1VQ03St90SeranaMoveTo)
endif

;Clear the elder scroll off of Serana
Alias_Serana.GetActorRef().UnequipItem(ElderScrollAmmo)
Alias_Serana.GetActorRef().RemoveItem(ElderScrollAmmo)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Tell the moth priest to begin his reading
;Update objectives
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Scene between Isran and Serana is over, Serana will now forcegreet.
SetObjectiveCompleted(15,1)
SetObjectiveDisplayed(20,1)
SetObjectiveDisplayed(24,1)
SetObjectiveDisplayed(26,1)

;Enable wrecked wagon scene
DLC1VQ03RoadsideDestroyed.Enable()

;Open Forbears' Holdout cave entrance
DLC1VQ03DoorEnableMarker.Enable()

(RNPCDialogueQuest as DLC1VQ03RNPCQuestScript).LookingForMothPriest = true
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

;Enable moth priest & vampire guards
Alias_Dexion.TryToEnable()
Alias_Dexion.GetActorReference().AllowBleedoutDialogue(true)
DLC1VQ03EnableVampireEscort.Enable()

;Enable camp POI vampire guards
;Alias_VampireEscort1.GetActorReference().SetActorValue("Aggression", 1)
;Alias_VampireEscort2.GetActorReference().SetActorValue("Aggression", 1)
;Alias_VampireEscort3.GetActorReference().SetActorValue("Aggression", 1)
DLC1VQ03CampVampires.Enable()

;Disable draugr in POI dungeon cell
DLC1_VQ03_DraugrParent.Disable()

;update base activities
DLC1HunterBaseIntroStage2.Start()
DLC1DialogueHunterBase.SetStage(10)

;Add the Forbear's Holdout map marker to the player's world map
DLC1ForbearsHoldoutMapMarkerREF.AddToMap()

;Start the "Domination scene"
DLC1VQ03HunterDominationScene.Start()

;Manage objectives
SetObjectiveCompleted(20)
SetObjectiveCompleted(24)
SetObjectiveCompleted(25)
SetObjectiveCompleted(26)
SetObjectiveCompleted(30)
SetObjectiveCompleted(32)
SetObjectiveCompleted(35)
SetObjectiveCompleted(37)
SetObjectiveDisplayed(40)

;Manage variables
((self as quest) as DLC1VQ03HunterVariables).VarDragonBridge = 1
((self as quest) as DLC1VQ03HunterVariables).VarWagon = 1
((self as quest) as DLC1VQ03HunterVariables).VarBook = 1
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

ObjectReference Property DLC1VQ03HunterSeranaStart  Auto  

ObjectReference Property DLC1VQ03RoadsideDestroyed  Auto  

ObjectReference Property DLC1VQ03EnableVampireEscort  Auto  

ObjectReference Property DLC1VQ03CampVampires  Auto  

ObjectReference Property DLC1VQ03HunterStage90IsranStand  Auto  

ObjectReference Property DLC1VQ03HunterStage90SeranaStand  Auto  

ObjectReference Property DLC1VQ03Stage90DexionStand  Auto  

ObjectReference Property DLC1VQ03HunterIsranStand  Auto  

DLC1_NPCMentalModelScript Property MM Auto

Quest Property RNPCDialogueQuest  Auto  

Quest Property pDLC1VQElder  Auto  


Quest Property DLC1HunterBaseIntroStage2  Auto  

Quest Property DLC1DialogueHunterBase  Auto  

Armor Property ElderScrollHandAttachArmor3rdP  Auto  

Scene Property DLC1VQ03HunterDominationScene  Auto  

ObjectReference Property DLC1VQ03DoorEnableMarker  Auto  

Faction Property DLC1HunterFaction  Auto  

Scene Property DLC1VQ03HunterMothPriestScene  Auto  

Scene Property DLC1VQ03HunterRecoveryScene  Auto  

Ammo Property ElderScrollAmmo auto

Quest Property DLC1VQ01  Auto  

Quest Property DLC1VQ02  Auto  

Quest Property DLC1HunterBaseIntro  Auto  

ObjectReference Property DLC1HunterHQEXTInitEnabled03  Auto  

ObjectReference Property DragonBridgeMapMarker  Auto  

ObjectReference Property DLC1ForbearsHoldoutMapMarkerREF  Auto  

Int Property VarDragonbridge  Auto  

ObjectReference Property DLC1VQ03St90DexionMoveTo  Auto  

ObjectReference Property DLC1VQ03St90SeranaMoveTo  Auto  

Faction Property CrimeFactionRift  Auto  

ObjectReference Property DLC1VQ03HunterStage90DexionStand  Auto  

Faction Property CrimeFactionHaafingar  Auto  
