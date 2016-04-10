;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 45
Scriptname DLC2_QF_DLC2MQ07_020179D7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY HermausMoraTA
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HermausMoraTA Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY miraak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_miraak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TameDragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TameDragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DragonToKill
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DragonToKill Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SprintTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SprintTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LoadBookTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LoadBookTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book01Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Book01Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FerryDragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FerryDragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WordWallTarget
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WordWallTarget Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book1Target
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book1Target Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThirskWorker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThirskWorker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ThirskWorker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ThirskWorker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dragon2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Dragon2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lurker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lurker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; player has read book 1
SetObjectiveCompleted(20) ; read book 1
SetObjectiveDisplayed(25) ; reach Miraak
; if player has gotten word already, advance quest
if DLC2MQ00.GetStageDone(20)
	setStage(240)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; start quest
SetObjectiveDisplayed(10)
SetActive(true)
; update loop checking for unlocking the words
RegisterForSingleUpdate(0.5)
; enable dragons
Alias_Dragon2.GetRef().Enable()
Alias_Dragon3.GetRef().Enable()
; disable Miraak's dragon for now
Alias_FerryDragon.GetRef().Disable()
Alias_Lurker.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN AUTOCAST TYPE dlc2mq06script
Quest __temp = self as Quest
dlc2mq06script kmyQuest = __temp as dlc2mq06script
;END AUTOCAST
;BEGIN CODE
; dragon 3 dies
kmyQuest.EnableHMBattle(true)
kmyQuest.EnableHMBattle(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; Miraak in furniture, restrain him
Alias_Miraak.GetActorRef().SetRestrained(true)
;Alias_Miraak.GetActorRef().StopCombatAlarm()
; add armor
;Alias_Miraak.GetActorRef().EquipItem(DLC2HMKillsMiraak)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; player has tamed dragon
Alias_FerryDragon.getActorRef().IgnoreFriendlyHits(true)
; make sure dragon is set to land on near side
Alias_FerryDragon.GetActorRef().SetForcedLandingMarker(NearLandingMarker)
SetObjectiveCompleted(30) ; tame dragon
SetObjectiveDisplayed(40) ; defeat miraak
; enable Miraak
Alias_Miraak.GetRef().Enable()
;Tell the ferry dragon to be hostile to Apocrypha stuff
; debug.Trace(self + ": should remove " + alias_FerryDragon + " from faction " + DLC2ApocryphaFaction)
alias_FerryDragon.getActorRef().RemoveFromFaction(DLC2ApocryphaFaction)
DLC2MQ06DragonFaction.SetEnemy(DLC2ApocryphaFaction)
;Set them to be non hostile
Alias_Miraak.GetActorRef().SetAv("Aggression", 0)
Alias_Dragon2.GetActorRef().SetAv("Aggression", 0)
Alias_Dragon3.GetActorRef().SetAv("Aggression", 0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; quickstart
DLC2MQ05.SetStage(0)
DLC2MQ05.SetStage(150)
DLC2MQ05.SetStage(700)
DLC2MQ05.SetStage(750)
DLC2MQ05.SetStage(1000)
DLC2MQ03B.SetStage(200) ; finish
; give player 3 dragon souls to unlock shout
Game.GetPlayer().ModActorValue("DragonSouls", 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player has unlocked all words in Bend Will shout
SetObjectiveCompleted(10) ; unlock shout
SetObjectiveDisplayed(20) ; Read book 1

;Enable the door to the dungeon area
;DLC2MQ06DoorToDungeonParentRef.Enable(abFadeIn = True)

; if player already in apocrypha, just advance to stage 200
if Game.GetPlayer().GetCurrentLocation() == DLC2Book01DungeonLocation
	setstage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; dragon arrives at temple
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; player has reached dragon landing zone

; if player has word, enable dragon now
if DLC2MQ00.GetStageDone(20)
	setStage(250)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE dlc2mq06script
Quest __temp = self as Quest
dlc2mq06script kmyQuest = __temp as dlc2mq06script
;END AUTOCAST
;BEGIN CODE
;fight Starts
Alias_Miraak.GetActorRef().RemoveFromFaction(DLC2MQ06NonHostileFaction)
Alias_Dragon2.GetActorRef().RemoveFromFaction(DLC2MQ06NonHostileFaction)
Alias_Dragon3.GetActorRef().RemoveFromFaction(DLC2MQ06NonHostileFaction)
DLC2MQ06HostileFaction.setEnemy(PlayerFaction)
DLC2MQ06MiraakFaction.SetEnemy(PlayerFaction)
Alias_Miraak.GetActorRef().SetAv("Aggression",1)
Alias_Dragon2.GetActorRef().SetAv("Aggression",1)
Alias_Dragon3.GetActorRef().SetAv("Aggression", 1)
alias_Miraak.getActorRef().startCombat(game.GetPlayer())
Alias_Dragon2.getActorRef().startCombat(game.GetPlayer())
Alias_Dragon3.getActorRef().startCombat(game.GetPlayer())
alias_FerryDragon.getActorRef().getActorBase().setEssential(False)
;alias_FerryDragon.getActorRef().RemoveFromFaction(DLC2ApocryphaFaction)
;DLC2MQ06DragonFaction.SetEnemy(DLC2ApocryphaFaction)
; enable HM battle watching:
kmyQuest.EnableHMBattle(true, 3)
; failsafe
setstage(335)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE dlc2mq06script
Quest __temp = self as Quest
dlc2mq06script kmyQuest = __temp as dlc2mq06script
;END AUTOCAST
;BEGIN CODE
; miraak defeated
(Alias_Miraak as DLC2MQ06MiraakBossBattle).fireMiraakKill = True
(Alias_Miraak as DLC2MQ06MiraakBossBattle).RegisterForSingleUpdate(0.1)

CompleteAllObjectives()
; add achievement
Game.AddAchievement(69)

; can now clear landing marker
Alias_FerryDragon.GetActorRef().ClearForcedLandingMarker() ; dragon now lands normally
Alias_FerryDragon.getActorRef().IgnoreFriendlyHits(false)
; clean up MQ05
DLC2MQ05.SetStage(1100)
; clear mind control state
kmyQuest.ClearMindControl()
DLC2TempleWorkerEnableMarker.Disable()
;revoke essential status of Skaal working on temple
DLC2OslafBase.SetEssential(false)
DLC2YsraBase.SetEssential(false)
; clear/delete Thirsk workers
if DLC2MH02.GetStageDone(35) == True
                ; delete them
                Alias_ThirskWorker1.GetRef().Delete()
                Alias_ThirskWorker1.GetRef().Delete()

if (DLC2MH02.IsRunning())
                                DLC2MH02.PostMQDealWith()
                endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
; player activates reward book
DLC2BookDungeonController.IncrementBookFinished()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; clean up

; clear dragon from being tamed? (may need to move that to OnChangeLocation on player script)
DLC2TameDragon.ReleaseDragon()

; post quest dialogue
DLC2MQ07.Start()
alias_ferryDragon.getReference().Disable()
alias_Dragon2.getReference().Disable()
alias_Dragon3.getReference().Disable()
alias_Miraak.getReference().Disable()
setstage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
; player has reached end section (back to Apocrypha worldspace)
; used to condition quest target
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
; player near temple - allow direct landing patrol
; trigger landing tutorial message if not yet requested
if DLC2DragonLandingRequested.value == 0.0
	Message.ResetHelpMessage("Activate")
	DLC2HelpDragonLandMsg.ShowAsHelpMessage("Activate", 5, 30, 1)
endif
; failsafe
setstage(335)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Player has learned word, dragon arrives
; release existing tamed dragon if there is one
if DLC2TameDragon.dragonAlias.GetRef() || DLC2TameDragon.dragonReleasedAlias.GetRef()
	DLC2TameDragon.ReleaseDragon()
	; skip release sequence - just remove from being tamed
	DLC2TameDragon.FinishRelease()
endif
; enable Miraak's dragon
Alias_FerryDragon.GetActorRef().Enable()
SetObjectiveCompleted(25)
SetObjectiveDisplayed(30) ; tame dragon
; make sure dragon is set to land on near side
utility.wait(0.5)
Alias_FerryDragon.GetActorRef().SetForcedLandingMarker(NearLandingMarker)
; clear tutorial message events
Message.ResetHelpMessage("Jump")
Message.ResetHelpMessage("Hotkey2")
Message.ResetHelpMessage("Sneak")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
; reenable player controls
Game.EnablePlayerControls(abMovement = true, abFighting = false, abCamSwitch = false, \
  abLooking = false, abSneaking = false, abMenu = false, abActivate = true, abJournalTabs = false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE dlc2mq06script
Quest __temp = self as Quest
dlc2mq06script kmyQuest = __temp as dlc2mq06script
;END AUTOCAST
;BEGIN CODE
; enable end book
DLC2ApocryphaBook01Ref.PlayAnimation("Rise")
utility.wait(2.0)
(DLC2ApocryphaBook01Ref as DLC2ApocryphaBookScript).EnableBookActivator()
; HM go away
kmyQuest.EnableHM(false)
; failsafe
SetStage(550)
; post quest dialogue
DLC2MQ07.Start()
; put player back in book alias so he can leave
BookDungeonPlayerAlias.ForceRefTo(game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE dlc2mq06script
Quest __temp = self as Quest
dlc2mq06script kmyQuest = __temp as dlc2mq06script
;END AUTOCAST
;BEGIN CODE
; Miraak death scene
kmyQuest.EnableHM(true)
DLC2MQ06MiraakDeathScene.Start()
alias_Miraak.getActorRef().StopCombat()
alias_Miraak.getActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE dlc2mq06script
Quest __temp = self as Quest
dlc2mq06script kmyQuest = __temp as dlc2mq06script
;END AUTOCAST
;BEGIN CODE
; dragon 2 dies
kmyQuest.EnableHMBattle(true)
kmyQuest.EnableHMBattle(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN AUTOCAST TYPE dlc2mq06script
Quest __temp = self as Quest
dlc2mq06script kmyQuest = __temp as dlc2mq06script
;END AUTOCAST
;BEGIN CODE
; dragon 1 dies
kmyQuest.EnableHMBattle(true)
kmyQuest.EnableHMBattle(true)
kmyQuest.EnableHMBattle(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; player is on dragon
; disable player controls to prevent dismounting
Game.DisablePlayerControls(abMovement = true, abFighting = false, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = false, abActivate = true, abJournalTabs = false)
; debug.trace(self + " player controls - is activate disabled? " + Game.IsActivateControlsEnabled())
; dragon now will only land at temple
Alias_FerryDragon.GetActorRef().SetForcedLandingMarker(TempleLandingMarker)
DLC2TameDragonOrbitMarker.MoveTo(TempleLandingMarker)
DLC2TameDragonBadLocations.addForm(DLC2Book01DungeonLocation)
; player will return to temple next time he reads Book01:
(Alias_Book1Target.GetRef() as DLC2BlackBookScript).SetDungeonMarker(DLC2BlackBook01PlayerTempleMarker)
; clear book dungeon player alias - player can now die for real
BookDungeonPlayerAlias.Clear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2MQ05  Auto  

ObjectReference Property TempleLandingMarker  Auto  
{landing marker on temple}

DLC2TameDragonScript Property DLC2TameDragon  Auto  

Location Property DLC2Book01DungeonLocation  Auto  

ObjectReference Property DLC2BlackBook01PlayerTempleMarker  Auto  

ObjectReference Property NearLandingMarker  Auto  
{landing marker on the near side of the water}
 

Faction Property DLC2MQ06NonHostileFaction  Auto  

Faction Property PlayerFaction  Auto  

Faction Property DLC2ApocryphaFaction  Auto  

Faction Property DLC2MQ06DragonFaction  Auto  

Scene Property DLC2MQ06MiraakDeathScene  Auto  

ObjectReference Property DLC2ApocryphaBook01Ref  Auto  

ObjectReference Property DLC2ApocryphaBook01ActivatorREF  Auto  

ReferenceAlias Property BookDungeonPlayerAlias  Auto  
{player alias from book dungeon - clear it here so player can die}

ObjectReference Property DLC2TempleWorkerEnableMarker  Auto  

ObjectReference Property DLC2MQ06DoorToDungeonParentRef  Auto  

Quest Property DLC2MQ03B  Auto  

Quest Property DLC2MQ00  Auto  

Quest Property DLC2MQ07  Auto  

DLC2MH02QuestScript Property DLC2MH02  Auto  

ActorBase Property DLC2OslafBase  Auto  

ActorBase Property DLC2YsraBase  Auto  

FormList Property DLC2TameDragonBadLocations  Auto  


Armor Property DLC2HMKillsMiraak  Auto  

DLC2BookDungeonControllerScript Property DLC2BookDungeonController  Auto  

Message Property DLC2HelpDragonLandMsg  Auto  

GlobalVariable Property DLC2DragonLandingRequested  Auto  

Faction Property DLC2MQ06HostileFaction  Auto  

ObjectReference Property DLC2TameDragonOrbitMarker  Auto  

Faction Property DLC2MQ06MiraakFaction  Auto  
