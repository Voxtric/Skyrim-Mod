;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 84
Scriptname DLC2_QF_DLC2dunKolbjornQST_0201810B Extends Quest Hidden

;BEGIN ALIAS PROPERTY QT_DraugrLeftToKill04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_DraugrLeftToKill04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_RalisJournal03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_RalisJournal03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ralis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ralis Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_DraugrLeftToKill03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_DraugrLeftToKill03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_DraugrLeftToKill01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_DraugrLeftToKill01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_DraugrLeftToKill05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_DraugrLeftToKill05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_Phase2Miner01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_Phase2Miner01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_Phase1Skull
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_Phase1Skull Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_DraugrLeftToKill02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_DraugrLeftToKill02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourierNote01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CourierNote01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_RalisJournal01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_RalisJournal01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornBarrowLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_KolbjornBarrowLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ExteriorChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ExteriorChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_RalisJournal05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_RalisJournal05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_Phase2Miner02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_Phase2Miner02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ahzidal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ahzidal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_RalisJournal04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_RalisJournal04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RalisKnockbackSource
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RalisKnockbackSource Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_KolbjornBarrowExterior
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_KolbjornBarrowExterior Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_RalisJournal02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_RalisJournal02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
;Quick Start - Advance to Phase 300, setting all appropriate stages along the way.
SetStage(2)
SetStage(210)
SetStage(220)
SetStage(230)
SetStage(240)
SetStage(250)
SetStage(260)
SetStage(275)
SetStage(299)
SetStage(300)
Alias_Ralis.GetActorRef().UnregisterForUpdate()
Alias_Ralis.GetActorRef().MoveTo(DLC2dunKolbjorn_RalisOutsideKolbjornMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_68
Function Fragment_68()
;BEGIN CODE
;Dialogue flag prior to setting the price for Phase 4.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
;PHASE 3:
;Player reports back in to Ralis. He agrees to continue work for 5000g.

;Complete Visit the Barrow, as a failsafe.
SetObjectiveCompleted(300)

;Player has reported in.
SetObjectiveCompleted(350)

;Add objective to pay for the next phase.
SetObjectiveDisplayed(360)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
;Stage set when Ralis is attacked.
if (!GetStageDone(490))
     SetStage(480)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
;When the player has closed out the quest (500) and taken the mask (510).
;Register for one final update, to clean up the camp once the player has left.
(Alias_Ralis as DLC2dunKolbjornRalisAliasScript).RegisterForSingleUpdate(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_77
Function Fragment_77()
;BEGIN CODE
;PHASE 1:
;When the player pays Ralis to excavate Phase 2, the quest registers for an update in 3d.
;When it updates, this stage is set, adding a note to the courier's chest.

;Add note to the courier's chest.
CourierScript.AddItemToContainer(CourierNote2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_69
Function Fragment_69()
;BEGIN CODE
;Dialogue flag on Ralis' final dialogue.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
;PHASE 2:
;Player pays Ralis to begin work on Phase 3.

;Complete objective to fund the excavation.
SetObjectiveCompleted(260)

;Display objective to wait for the courier.
SetObjectiveDisplayed(275)

;- Ralis remains at Kolbjorn.
;- Register Ralis for an update. We periodically check to see if the player has left the area.
;  when they do, or when Ralis unloads, we enable the Phase 3 mining camp and miners.
(Alias_Ralis as DLC2dunKolbjornRalisAliasScript).RegisterForSingleUpdate(10)
;- Register this quest for an update. In 3d, add a letter to the courier's chest to advance the quest.
Self.RegisterForSingleUpdateGameTime(3 * 24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;PHASE 2
;Player finds the body of the second miner. Used as an objective flag.
SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_71
Function Fragment_71()
;BEGIN CODE
;Dialogue flag on Ralis' final dialogue.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_43
Function Fragment_43()
;BEGIN CODE
;PHASE 3:
;The player speaks to Ralis and learns they need to clear out the Draugr again.
;Complete Visit the Barrow.
SetObjectiveCompleted(300)
if (!GetStageDone(330))
     SetObjectiveDisplayed(330)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_58
Function Fragment_58()
;BEGIN CODE
;Stages 10-19 are initial dialogue flags on Ralis.
;Stage 13: Player fails bribe challenge to convince Ralis to tell them about Kolbjorn directly.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
;PHASE 3:
;When Ralis next unloads, or when the Phase 4 Dig completes, this stage gets set.

;Enable the Phase 4 Mining Camp.
DLC2dunKolbjornExt_Stage04_Disable.Disable()
DLC2dunKolbjornExt_Stage04_Enable.Enable()
DLC2dunKolbjornExt_Stage03_RalisTent.Disable()
DLC2dunKolbjornExt_Stage04_RalisTent.Enable()

;Disable the Phase 3 Draugr and Dead Miners.
DLC2dunKolbjornInt_Stage03_DraugrAndMiners.Disable()

;Enable the Phase 4 Miners.
DLC2dunKolbjornExt_Stage03_MinersWhoLive.Disable()
DLC2dunKolbjornExt_Stage04_Miners.Enable()

;Move Ralis' Journal Vol I-IV to safety.
Actor player = Game.GetPlayer()
if (player.GetItemCount(Alias_QT_RalisJournal01.GetReference()) == 0)
     DLC2dunKolbjornJournal01.MoveTo(DLC2dunKolbjornRalisJournal01MoveMarker02)
EndIf
if (player.GetItemCount(Alias_QT_RalisJournal02.GetReference()) == 0)
     DLC2dunKolbjornJournal02.MoveTo(DLC2dunKolbjornRalisJournal02MoveMarker)
EndIf
if (player.GetItemCount(Alias_QT_RalisJournal03.GetReference()) == 0)
     DLC2dunKolbjornJournal03.MoveTo(DLC2dunKolbjornRalisJournal03MoveMarker)
EndIf
if (player.GetItemCount(Alias_QT_RalisJournal04.GetReference()) == 0)
     DLC2dunKolbjornJournal04.MoveTo(DLC2dunKolbjornRalisJournal04MoveMarker)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_79
Function Fragment_79()
;BEGIN CODE
;PHASE 3:
;When the player pays Ralis to excavate Phase 4, the quest registers for an update in 3d.
;When it updates, this stage is set, adding a note to the courier's chest.

;Add note to the courier's chest.
CourierScript.AddItemToContainer(CourierNote4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;PHASE 1:
;Player opens the door into the Main Chamber. There's a lot more work to be done.

;We've found a way forward.
SetObjectiveCompleted(140)

;If we've also opened the path, speak to Ralis to continue.
if (GetStageDone(130))
     SetStage(150)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
;Close out the quest (regardless of resolution).
CompleteAllObjectives()
CompleteQuest()
(AchievementsQuest as AchievementsScript).IncSideQuests()

if (GetStageDone(500) && GetStageDone(9))
     SetStage(550)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Quest quick start.

;Move player to Raven Rock's Retching Netch.
Game.GetPlayer().MoveTo(DLC2dunKolbjornQSTStage0Marker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
;PHASE 4
;Player kills Ralis.

;Player has killed him.
SetObjectiveCompleted(480)

;Wrap up the quest.
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;PHASE 2:
;The player speaks to Ralis and learns they need to clear out the Draugr and see what happened to
;miners Bradyn and Mireli.
;Complete Visit the Barrow.
SetObjectiveCompleted(200)
if (!GetStageDone(230))
     SetObjectiveDisplayed(230)
EndIf
;Display objective to find Bradyn and Mireli.
if (!GetStageDone(240))
     SetObjectiveDisplayed(240)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;PHASE 2:
;When Ralis next unloads, or when the Phase 3 Dig completes, this stage gets set.

;Enable the Phase 3 Mining Camp.
DLC2dunKolbjornExt_Stage03_Disable.Disable()
DLC2dunKolbjornExt_Stage03_Enable.Enable()
DLC2dunKolbjornExt_Stage02_RalisTent.Disable()
DLC2dunKolbjornExt_Stage03_RalisTent.Enable()

;Disable the Phase 2 Draugr and Dead Miners.
DLC2dunKolbjornInt_Stage02_DraugrAndMiners.Disable()

;Enable the Phase 3 Miners.
DLC2dunKolbjornExt_Stage03_MinersWhoLive.Enable()
DLC2dunKolbjornExt_Stage03_MinersWhoDie.Enable()

;Move Ralis' Journal Vol I-III to safety.
Actor player = Game.GetPlayer()
if (player.GetItemCount(Alias_QT_RalisJournal01.GetReference()) == 0)
     DLC2dunKolbjornJournal01.MoveTo(DLC2dunKolbjornRalisJournal01MoveMarker02)
EndIf
if (player.GetItemCount(Alias_QT_RalisJournal02.GetReference()) == 0)
     DLC2dunKolbjornJournal02.MoveTo(DLC2dunKolbjornRalisJournal02MoveMarker)
EndIf
if (player.GetItemCount(Alias_QT_RalisJournal03.GetReference()) == 0)
     DLC2dunKolbjornJournal03.MoveTo(DLC2dunKolbjornRalisJournal03MoveMarker)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;PHASE 1:
;When Ralis next unloads, or when the Phase 2 Dig completes, this stage gets set.

;Enable the Phase 2 Mining Camp.
DLC2dunKolbjornExt_Stage01_RalisSupplemental.Disable()
DLC2dunKolbjornExt_Stage02_Disable.Disable()
DLC2dunKolbjornExt_Stage02_Enable.Enable()
DLC2dunKolbjornExt_Stage00_RalisTent.Disable()
DLC2dunKolbjornExt_Stage02_RalisTent.Enable()

;Disable the Phase 1 Draugr and Dead Miners.
DLC2dunKolbjornInt_Stage01_DraugrAndMiners.Disable()

;Enable the Phase 2 Miners.
DLC2dunKolbjornExt_Stage02_Miners.Enable()

;No journals to move on this stage.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;PHASE 2:
;Player finds the bodies of two miners that didn't make it. This is effectively automatic; you just have
;to hit a trigger box in the last room.

;We've found the bodies.
SetObjectiveCompleted(240)

;If we've also opened the path, speak to Ralis to continue.
if (GetStageDone(230))
     SetStage(250)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_76
Function Fragment_76()
;BEGIN CODE
;When the player pays Ralis to excavate Phase 1, the quest registers for an update in 3d.
;When it updates, this stage is set, adding a note to the courier's chest.

;Add note to the courier's chest.
CourierScript.AddItemToContainer(Alias_CourierNote01.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Player convinces Ralis to tell him about the expedition and asks about funding it.
;Ralis sets the price at 1000g. Player hasn't agreed to pay it yet.

;Complete misc objectives, if any.
DLC2dunKolbjornMiscQST.SetStage(30)

;Display objective to find the funds.
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
;Quick Start - Advance to Phase 100, setting all appropriate stages along the way.
SetStage(10)
SetStage(11)
SetStage(12)
SetStage(13)
SetStage(20)
SetStage(30)
SetStage(40)
SetStage(75)
SetStage(100)
Alias_Ralis.GetActorRef().UnregisterForUpdate()
Alias_Ralis.GetActorRef().MoveTo(DLC2dunKolbjorn_RalisOutsideKolbjornMarker)
Game.GetPlayer().MoveTo(DLC2dunKolbjorn_PlayerOutsideKolbjornMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_70
Function Fragment_70()
;BEGIN CODE
;Dialogue flag on Ralis' final dialogue.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_80
Function Fragment_80()
;BEGIN CODE
;Clean up the Kolbjorn Exterior camp.

;Disable all enable markers.
DLC2dunKolbjornExt_Stage00_Enable.Disable()
;DLC2dunKolbjornExt_Stage01_Enable.Disable() ;Leave this one, to keep the scaffolding.
DLC2dunKolbjornExt_Stage02_Enable.Disable()
DLC2dunKolbjornExt_Stage03_Enable.Disable()
DLC2dunKolbjornExt_Stage04_Enable.Disable()
DLC2dunKolbjornExt_Stage04_RalisTent.Disable()
DLC2dunKolbjornExt_Stage04_ChaosEnable.Disable()

;Clean up any journals the player didn't take.
Actor player = Game.GetPlayer()
if (player.GetItemCount(DLC2dunKolbjornJournal01) == 0)
     DLC2dunKolbjornJournal01.Disable()
     DLC2dunKolbjornJournal01.Delete()
EndIf
if (player.GetItemCount(DLC2dunKolbjornJournal02) == 0)
     DLC2dunKolbjornJournal02.Disable()
     DLC2dunKolbjornJournal02.Delete()
EndIf
if (player.GetItemCount(DLC2dunKolbjornJournal03) == 0)
     DLC2dunKolbjornJournal03.Disable()
     DLC2dunKolbjornJournal03.Delete()
EndIf
if (player.GetItemCount(DLC2dunKolbjornJournal04) == 0)
     DLC2dunKolbjornJournal04.Disable()
     DLC2dunKolbjornJournal04.Delete()
EndIf
if (player.GetItemCount(DLC2dunKolbjornJournal05) == 0)
     DLC2dunKolbjornJournal05.Disable()
     DLC2dunKolbjornJournal05.Delete()
EndIf

;Turn on postquest clutter.
DLC2dunKolbjornExt_Stage05_PostquestEnable.Enable()

;Shut down the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
;PHASE 4:
;When the player approaches Kolbjorn, they realize Ralis isn't here.
;Complete Visit the Barrow.
SetObjectiveCompleted(400)

;Add objective to locate him.
SetObjectiveDisplayed(410)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
;Stages 10-19 are initial dialogue flags on Ralis.
;Stage 14: Ralis tells the full story about Kolbjorn.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Player pays Ralis 1000g to fund the first phase of the expedition.

;Complete objective to fund the excavation.
SetObjectiveCompleted(40)

;Display objective to wait for the courier.
SetObjectiveDisplayed(75)

;- Ralis remains at Kolbjorn.
;- Register Ralis for an update. We periodically check to see if the player has left the area.
;  when they do, or when Ralis unloads, we enable the Phase 1 mining camp and miners.
(Alias_Ralis as DLC2dunKolbjornRalisAliasScript).RegisterForSingleUpdate(10)
;- Register this quest for an update. In 3d, add a letter to the courier's chest to advance the quest.
Self.RegisterForSingleUpdateGameTime(3 * 24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;PHASE 1:
;Player reports back in to Ralis. He agrees to continue work for 1500g.

;Complete Visit the Barrow, as a failsafe.
SetObjectiveCompleted(100)

;Player has reported in.
SetObjectiveCompleted(150)

;Add objective to pay for the next phase.
SetObjectiveDisplayed(160)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Stages 10-19 are initial dialogue flags on Ralis.
;Stage 12: Player fails persuade challenge to convince Ralis to tell them about Kolbjorn directly.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;PHASE 4
;Begin the battle with Ahzidal.

Actor Ralis = Alias_Ralis.GetActorReference()
Actor Ahzidal = Alias_Ahzidal.GetActorReference()

;No longer back-gating this battle.
;Drop the portcullis.
;DLC2dunKolbjornBossRoomEnt.Activate(Ahzidal)
;DLC2dunKolbjornBossRoomCollision.Disable()

;Activate Ahzidal
Ahzidal.PlaceAtMe(ExplosionIllusionDark01)
Ahzidal.Activate(Ahzidal)

;Take Ralis out of the fight.
Alias_Ralis.GetActorRef().SetGhost(False)
Alias_RalisKnockbackSource.GetActorRef().DoCombatSpellApply(DLC2dunKolbjornRalisKnockback, Ralis)
Ralis.SetNoBleedoutRecovery(True)
Ralis.DamageAV("Health", 1000)
Alias_Ralis.GetActorRef().SetGhost(True)

;Wait briefly, then activate the boss battle manager.
Utility.Wait(1)
DLC2dunKolbjornBossBattleManager.Activate(Ahzidal)

;Enable triggers to stem the flow of Draugr if the player bails out.
DLC2dunKolbjornProgressiveEnableTrigger.Enable()
DLC2dunKolbjornProgressiveDisableTrigger.Enable()

;Display objective to defeat Ahzidal.
SetObjectiveCompleted(410)
SetObjectiveDisplayed(450)

;Wait a bit more before disabling the dais effect.
Utility.Wait(2)
Dais.PlayAnimation("Reset")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Stages 10-19 are initial dialogue flags on Ralis.
;Stage 11: Player has spoken to Ralis.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Stages 10-19 are initial dialogue flags on Ralis.
;Stage 10: Innkeeper rumor suggests the player speak to Ralis. Complete when the quest proper starts.

;Display misc objective to speak to Ralis, if you haven't already.
if (GetStage() < 20)
     DLC2dunKolbjornMiscQST.SetStage(10)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
;PHASE 3:
;When the player both kills all the Phase 3 Draugr, have them return to Ralis to continue.
SetObjectiveDisplayed(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;PHASE 2:
;The Phase 2 courier letter is delivered.

;Complete the wait for message objective.
SetObjectiveCompleted(175)

;Enable the updated mining camp, if we haven't already.
if (!GetStageDone(199))
    SetStage(199)
endif

;Disable the miners. They're all dead.
DLC2dunKolbjornExt_Stage02_Miners.Disable()

;Set up the Barrow for Phase 2.
DLC2dunKolbjornInt_Stage02_Disable.Disable()
DLC2dunKolbjornInt_Stage02_Enable.Enable()
DLC2dunKolbjornInt_Stage01_MainRoomDebris.Disable()
DLC2dunKolbjornInt_Stage02_MainRoomDebris.Enable()
DLC2dunKolbjornInt_Stage02_DraugrAndMiners.Enable()

;Start the Phase 2 kill-tracking quest.
DLC2dunKolbjornPhase2TrackingQST.Start()

;Enable Ralis' Journal Vol III.
DLC2dunKolbjornJournal03.Enable()

;Tell the player to check out Kolbjorn.
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
;PHASE 4
;Player decides to kill Ralis (or just attacks him). Display objective to kill him and start combat.
SetObjectiveDisplayed(480)
Actor Ralis = Alias_Ralis.GetActorRef()
Ralis.GetActorBase().SetEssential(False)
Ralis.SetAV("Aggression", 2)
DLC2dunKolbjornMinerFaction.SetEnemy(PlayerFaction)
Ralis.StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;PHASE 4:
;The Phase 4 courier letter is delivered.

;Complete the wait for message objective.
SetObjectiveCompleted(375)

;Enable the updated mining camp, if we haven't already.
if (!GetStageDone(399))
    SetStage(399)
endif

;Disable the miners. They're all dead.
DLC2dunKolbjornExt_Stage04_Miners.Disable()

;Enable corpses and chaos in the exterior
DLC2dunKolbjornExt_Stage04_ChaosEnable.Enable()

;Set up the Barrow for Phase 4.
DLC2dunKolbjornInt_Stage04_Enable.Enable()
DLC2dunKolbjornInt_Stage04_Disable.Disable()
DLC2dunKolbjornInt_Stage03_MainRoomDebris.Disable()
DLC2dunKolbjornInt_Stage04_MainRoomDebris.Enable()
DLC2dunKolbjornInt_Stage04_DraugrAndMiners.Enable()

;Move Ralis to the boss chamber.
Alias_Ralis.GetActorRef().MoveTo(DLC2dunKolbjornRalisBossMarker)
Alias_Ralis.GetActorRef().EvaluatePackage()
Alias_Ralis.GetActorRef().SetGhost(True)

;Enable Ralis' Journal Vol V.
DLC2dunKolbjornJournal05.Enable()

;Tell the player to check out Kolbjorn.
SetObjectiveDisplayed(400)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;PHASE 4
;Ahzidal is killed.
SetObjectiveCompleted(450)
Actor Ralis = Alias_Ralis.GetActorReference()
Actor Ahzidal = Alias_Ahzidal.GetActorReference()

;Kill any surviving Draugr.
(DLC2dunKolbjornBossBattleManager as dunProgressiveCombatScript).ActivateAndKillAllEnemies()

;Reopen the exits.
;No longer back-gating this battle.
;Utility.Wait(3)
;DLC2dunKolbjornBossRoomEnt.Activate(Ahzidal)
Utility.Wait(3)
DLC2dunKolbjornBossRoomExit.Activate(Alias_Ralis.GetActorRef())

;Let Ralis get up.
Alias_Ralis.GetActorRef().SetGhost(False)
Ralis.SetAV("Aggression", 0)
Ralis.SetNoBleedoutRecovery(False)
Ralis.RestoreAV("Health", 1000)
DLC2dunKolbjornMinerFaction.SetPlayerEnemy(False)

;Display objective to confront Ralis.
SetObjectiveDisplayed(475)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;PHASE 2:
;Set by the Phase 2 Tracking quest when all of the Phase 2 Draugr are dead.

;We've killed all the Draugr...
SetObjectiveCompleted(230)

;If we've also found the bodies, speak to Ralis to continue.
if (GetStageDone(240))
     SetStage(250)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;PHASE 1:
;The player speaks to Ralis and learns they need to clear out the Draugr and find a way forward.
;Complete Visit the Barrow.
SetObjectiveCompleted(100)
;Display objective to clear the Draugr.
if (!GetStageDone(130))
     SetObjectiveDisplayed(130)
EndIf
;Display objective to find a way forward.
if (!GetStageDone(140))
     SetObjectiveDisplayed(140)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;PHASE 1:
;When the player both kills the Phase 1 Draugr AND opens a path forward,
;have them return to Ralis to continue.
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;When Ralis next unloads, or when the Phase 1 Dig completes, this stage gets set.

;Enable the Phase 1 Mining Camp.
DLC2dunKolbjornExt_Stage00_Disable.Disable()
DLC2dunKolbjornExt_Stage00_Enable.Enable()
DLC2dunKolbjornExt_Stage00_RalisTent.Enable()

;Enable the Phase 1 Miners.
DLC2dunKolbjornExt_Stage00_Miners.Enable()

;Move Journal Vol I out of the mining area.
Actor player = Game.GetPlayer()
if (player.GetItemCount(Alias_QT_RalisJournal01.GetReference()) == 0)
     DLC2dunKolbjornJournal01.MoveTo(DLC2dunKolbjornRalisJournal01MoveMarker01)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
;PHASE 3:
;Player pays Ralis to begin work on Phase 4.

;Complete objective to fund the excavation.
SetObjectiveCompleted(360)

;Display objective to wait for the courier.
SetObjectiveDisplayed(375)

;- Ralis remains at Kolbjorn.
;- Register Ralis for an update. We periodically check to see if the player has left the area.
;  when they do, or when Ralis unloads, we enable the Phase 4 mining camp and miners.
(Alias_Ralis as DLC2dunKolbjornRalisAliasScript).RegisterForSingleUpdate(10)
;- Register this quest for an update. In 3d, add a letter to the courier's chest to advance the quest.
Self.RegisterForSingleUpdateGameTime(3 * 24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;PHASE 1:
;The Phase 1 courier letter is delivered.

;Complete the wait for message objective.
SetObjectiveCompleted(75)

;Enable the mining camp, if we haven't already.
if (!GetStageDone(99))
     SetStage(99)
endif

;Disable the miners. They're all dead.
DLC2dunKolbjornExt_Stage00_Miners.Disable()

;Set up the Barrow for Phase 1.
DLC2dunKolbjornExt_Stage01_RalisSupplemental.Enable()
DLC2dunKolbjornExt_Stage01_Disable.Disable()
DLC2dunKolbjornExt_Stage01_Enable.Enable()
DLC2dunKolbjornInt_Stage01_Disable.Disable()
DLC2dunKolbjornInt_Stage01_Enable.Enable()
DLC2dunKolbjornInt_Stage01_MainRoomDebris.Enable()
DLC2dunKolbjornInt_Stage01_DraugrAndMiners.Enable()

;Start the Phase 1 kill-tracking quest.
DLC2dunKolbjornPhase1TrackingQST.Start()

;Enable Ralis' Journal Vol II.
DLC2dunKolbjornJournal02.Enable()

;Tell the player to check out Kolbjorn.
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;PHASE 3:
;The Phase 3 courier letter is delivered.

;Complete the wait for message objective.
SetObjectiveCompleted(275)

;Enable the updated mining camp, if we haven't already.
if (!GetStageDone(299))
    SetStage(299)
endif

;Disable the miners who died. A few survive this time.
DLC2dunKolbjornExt_Stage03_MinersWhoDie.Disable()

;Set up the Barrow for Phase 3.
DLC2dunKolbjornInt_Stage03_Disable.Disable()
DLC2dunKolbjornInt_Stage03_Enable.Enable()
DLC2dunKolbjornInt_Stage02_MainRoomDebris.Disable()
DLC2dunKolbjornInt_Stage03_MainRoomDebris.Enable()
DLC2dunKolbjornInt_Stage03_DraugrAndMiners.Enable()

;Start the Phase 3 kill-tracking quest.
DLC2dunKolbjornPhase3TrackingQST.Start()

;Enable Ralis' Journal Vol IV.
DLC2dunKolbjornJournal04.Enable()

;Tell the player to check out Kolbjorn.
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;PHASE 1:
;Set by the Phase 1 Tracking quest when only 3 Draugr are left alive.
;Killing these will allow the dig to continue.

;Consider pinging objective 130 here?
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;PHASE 4
;Set up for the battle with Ahzidal.

;Ralis begins his ritual.
DLC2dunKolbjornQST_AhzidalResurrectionScene.Start()

;Enable enemies and miners in the boss chamber.
DLC2dunKolbjornBossEnemiesEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN CODE
;Quick Start - Advance to Phase 500, setting all appropriate stages along the way.
;Assumes the 'Save Ralis' path.
SetStage(4)
SetStage(410)
SetStage(490)
SetStage(500)
Alias_Ralis.GetActorRef().UnregisterForUpdate()
Alias_Ralis.GetActorRef().MoveToMyEditorLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_82
Function Fragment_82()
;BEGIN CODE
;Player takes Ahzidal's mask.
if (GetStageDone(500) && GetStageDone(9))
     SetStage(550)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;PHASE 4
;Player has entered Ahzidal's Chamber.

;Force Ralis' scene to advance (automatic).

;No longer back-gating this battle.
;Enable collision to keep the player from getting out.
;DLC2dunKolbjornBossRoomCollision.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;PHASE 1:
;Set by the Phase 1 Tracking quest when all of the Phase 1 Draugr are dead.

;We've killed all the Draugr...
SetObjectiveCompleted(130)

;If we've also opened the path, speak to Ralis to continue.
if (GetStageDone(140))
     SetStage(150)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
;Quick Start - Advance to Phase 200, setting all appropriate stages along the way.
SetStage(1)
SetStage(110)
SetStage(120)
SetStage(130)
SetStage(140)
SetStage(150)
SetStage(160)
SetStage(175)
SetStage(199)
SetStage(200)
Alias_Ralis.GetActorRef().UnregisterForUpdate()
Alias_Ralis.GetActorRef().MoveTo(DLC2dunKolbjorn_RalisOutsideKolbjornMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
;PHASE 3:
;Set by the Phase 3 Tracking quest when only 3 Draugr are left alive.
;Killing these will allow the dig to continue.

;Consider pinging objective 330 here?
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
;Quick Start - Advance to Phase 400, setting all appropriate stages along the way.
SetStage(3)
SetStage(310)
SetStage(320)
SetStage(230)
SetStage(350)
SetStage(360)
SetStage(375)
SetStage(399)
SetStage(400)
Alias_Ralis.GetActorRef().UnregisterForUpdate()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
;PHASE 3:
;Set by the Phase 3 Tracking quest when all of the Phase 3 Draugr are dead.

;We've killed all the Draugr...
SetObjectiveCompleted(330)

;No second objective for this phase, so just continue on to Stage 350.
SetStage(350)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_78
Function Fragment_78()
;BEGIN CODE
;PHASE 2:
;When the player pays Ralis to excavate Phase 3, the quest registers for an update in 3d.
;When it updates, this stage is set, adding a note to the courier's chest.

;Add note to the courier's chest.
CourierScript.AddItemToContainer(CourierNote3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;PHASE 4
;Player decides to let Ralis live.

;Ralis becomes a friend.
Actor Ralis = Alias_Ralis.GetActorRef()
Ralis.SetRelationshipRank(Game.GetPlayer(), 1)

;Switch from Essential to Protected.
Ralis.GetActorBase().SetEssential(False)
Ralis.GetActorBase().SetProtected(True)

;Ralis heads back to Raven Rock (package conditions).

;Wrap up the quest.
SetStage(500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;PHASE 2:
;Set by the Phase 2 Tracking quest when only 3 Draugr are left alive.
;Killing these will allow the dig to continue.

;Consider pinging objective 230 here?
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
;Stages 10-19 are initial dialogue flags on Ralis.
;Stage 15: The player offers to fund Ralis' expedition.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;PHASE 2:
;Player reports back in to Ralis. He agrees to continue work for 2500g.

;Complete Visit the Barrow, as a failsafe.
SetObjectiveCompleted(200)

;Player has reported in.
SetObjectiveCompleted(250)

;Add objective to pay for the next phase.
SetObjectiveDisplayed(260)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
;Dialogue flag prior to setting the price for Phase 4.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;PHASE 1:
;Player pays Ralis to begin work on Phase 2.

;Complete objective to fund the excavation.
SetObjectiveCompleted(160)

;Display objective to wait for the courier.
SetObjectiveDisplayed(175)

;- Ralis remains at Kolbjorn.
;- Register Ralis for an update. We periodically check to see if the player has left the area.
;  when they do, or when Ralis unloads, we enable the Phase 2 mining camp and miners.
(Alias_Ralis as DLC2dunKolbjornRalisAliasScript).RegisterForSingleUpdate(10)
;- Register this quest for an update. In 3d, add a letter to the courier's chest to advance the quest.
Self.RegisterForSingleUpdateGameTime(3 * 24)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;PHASE 2
;Player finds the body of the first miner. Used as an objective flag.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;PHASE 2:
;When the player both kills the Phase 2 Draugr AND finds the bodies,
;have them return to Ralis to continue.
SetObjectiveDisplayed(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_66
Function Fragment_66()
;BEGIN CODE
;Dialogue flag in the Phase 1 intro dialogue.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


;The quest updates 3d after the player pays Ralis for the next phase.
;It sets the next 'Stage 98' in sequence, adding a letter to the courier's chest.
Event OnUpdateGameTime()
	If (GetStageDone(375))
		SetStage(398)
	ElseIf (GetStageDone(275))
		SetStage(298)
	ElseIf (GetStageDone(175))
		SetStage(198)
	ElseIf (GetStageDone(75))
		SetStage(98)
	EndIf 
EndEvent


ObjectReference Property DLC2dunKolbjornExt_Stage01_Enable  Auto
ObjectReference Property DLC2dunKolbjornExt_Stage01_Disable  Auto

ObjectReference Property DLC2dunKolbjornExt_Stage02_Enable  Auto
ObjectReference Property DLC2dunKolbjornExt_Stage02_Disable  Auto

ObjectReference Property DLC2dunKolbjornExt_Stage03_Enable  Auto
ObjectReference Property DLC2dunKolbjornExt_Stage03_Disable  Auto

ObjectReference Property DLC2dunKolbjornExt_Stage04_Enable  Auto
ObjectReference Property DLC2dunKolbjornExt_Stage04_Disable  Auto

ObjectReference Property DLC2dunKolbjornInt_Stage01_Enable  Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage01_Disable Auto  

ObjectReference Property DLC2dunKolbjornInt_Stage02_Enable  Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage02_Disable Auto  

ObjectReference Property DLC2dunKolbjornInt_Stage03_Enable  Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage03_Disable Auto  

ObjectReference Property DLC2dunKolbjornInt_Stage04_Enable  Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage04_Disable Auto  

ObjectReference Property DLC2dunKolbjornInt_Stage01_MainRoomDebris Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage02_MainRoomDebris Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage03_MainRoomDebris Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage04_MainRoomDebris Auto  


ObjectReference Property DLC2dunKolbjornRalisBossMarker  Auto  

Explosion Property ExplosionIllusionDark01  Auto  

SPELL Property DLC2dunKolbjornRalisKnockback  Auto  

ObjectReference Property DLC2dunKolbjornBossRoomEnt  Auto  

ObjectReference Property DLC2dunKolbjornBossRoomExit  Auto  

ObjectReference Property DLC2dunKolbjornBossEnemiesEnableMarker  Auto  

Keyword Property LinkCustom02  Auto  

ObjectReference Property DLC2dunKolbjornBossRoomCollision  Auto  

Scene Property DLC2dunKolbjornQST_AhzidalResurrectionScene  Auto  

ObjectReference Property DLC2dunKolbjornBossBattleManager  Auto  

ObjectReference Property DLC2dunKolbjornQSTStage0Marker Auto  

ObjectReference Property DLC2dunKolbjornExt_Stage00_Enable  Auto  

ObjectReference Property DLC2dunKolbjornExt_Stage00_Disable  Auto  

ObjectReference Property DLC2dunKolbjornRalisJournal01MoveMarker  Auto  

ObjectReference Property DLC2dunKolbjornExt_Stage00_Miners  Auto  

ObjectReference Property DLC2dunKolbjornRalisJournal1  Auto  

ObjectReference Property DLC2dunKolbjornExt_Stage02_Miners  Auto  

ObjectReference Property DLC2dunKolbjornExt_Stage03_MinersWhoLive  Auto  

ObjectReference Property DLC2dunKolbjornExt_Stage03_MinersWhoDie  Auto  

ObjectReference Property DLC2dunKolbjornExt_Stage04_Miners  Auto  

ObjectReference Property DLC2dunKolbjornExt_Stage00_RalisTent  Auto  
ObjectReference Property DLC2dunKolbjornExt_Stage02_RalisTent  Auto  
ObjectReference Property DLC2dunKolbjornExt_Stage03_RalisTent  Auto  
ObjectReference Property DLC2dunKolbjornExt_Stage04_RalisTent  Auto  

ObjectReference Property DLC2dunKolbjornInt_Stage01_DraugrAndMiners  Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage02_DraugrAndMiners  Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage03_DraugrAndMiners  Auto  
ObjectReference Property DLC2dunKolbjornInt_Stage04_DraugrAndMiners  Auto  

ObjectReference Property DLC2dunKolbjornJournal01 Auto
ObjectReference Property DLC2dunKolbjornJournal02 Auto
ObjectReference Property DLC2dunKolbjornJournal03 Auto
ObjectReference Property DLC2dunKolbjornJournal04 Auto
ObjectReference Property DLC2dunKolbjornJournal05 Auto
ObjectReference Property DLC2dunKolbjornRalisJournal01MoveMarker01 Auto
ObjectReference Property DLC2dunKolbjornRalisJournal01MoveMarker02 Auto
ObjectReference Property DLC2dunKolbjornRalisJournal02MoveMarker Auto
ObjectReference Property DLC2dunKolbjornRalisJournal03MoveMarker Auto
ObjectReference Property DLC2dunKolbjornRalisJournal04MoveMarker Auto

Quest Property DLC2dunKolbjornMiscQST  Auto  

Quest Property AchievementsQuest  Auto  

ObjectReference Property DLC2dunKolbjornExt_Stage04_ChaosEnable  Auto  

ObjectReference Property DLC2dunKolbjorn_PlayerOutsideKolbjornMarker  Auto  

ObjectReference Property DLC2dunKolbjorn_RalisOutsideKolbjornMarker  Auto  

ObjectReference Property DLC2dunKolbjornMapMarker  Auto  

Quest Property DLC2dunKolbjornPhase1TrackingQST  Auto  

Quest Property DLC2dunKolbjornPhase2TrackingQST  Auto  

Quest Property DLC2dunKolbjornPhase3TrackingQST  Auto  

Faction Property PlayerFaction  Auto  

Faction Property DLC2dunKolbjornMinerFaction  Auto  

ObjectReference Property DLC2dunKolbjornExt_Stage05_PostquestEnable  Auto  

ObjectReference Property DLC2dunKolbjornHideRalisJournals  Auto  

Book Property CourierNote1  Auto  

WICourierScript Property CourierScript  Auto  

Book Property CourierNote2  Auto  

Book Property CourierNote3  Auto  

Book Property CourierNote4  Auto  

ObjectReference Property DLC2dunKolbjornExt_Stage01_RalisSupplemental  Auto  

ObjectReference Property DLC2dunKolbjornProgressiveDisableTrigger  Auto  

ObjectReference Property DLC2dunKolbjornProgressiveEnableTrigger  Auto  

ObjectReference Property Dais  Auto  
