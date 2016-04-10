;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 149
Scriptname DLC1_QF_DLC1LD_01005817 Extends Quest Hidden

;BEGIN ALIAS PROPERTY QT_D2IntroBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D2IntroBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameShard1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameShard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY D4BookCorpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_D4BookCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameShard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameShard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_D1_Summit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D1_Summit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameShard4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameShard4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Shard4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Shard4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Shard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Shard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrestNP
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrestNP Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Katria
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Katria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_D5_ValveLeft
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D5_ValveLeft Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Crest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Crest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrestPedestal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrestPedestal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Forgemaster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Forgemaster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_D3IntroBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D3IntroBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Shard3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Shard3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_D4IntroBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D4IntroBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Shard1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Shard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KatriaCorpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KatriaCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CrestPedestalTrig
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CrestPedestalTrig Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY D3BookCorpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_D3BookCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NameShard3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NameShard3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_D5_MaterialsChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D5_MaterialsChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KatriaJournal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KatriaJournal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_D5_AetheriumForge
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D5_AetheriumForge Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_DoorToRaldbthar02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_DoorToRaldbthar02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_D5_BthalftStandClearMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D5_BthalftStandClearMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_D1KatriaIntroBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D1KatriaIntroBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_D5_ValveRight
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D5_ValveRight Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_DoorToRaldbthar01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_DoorToRaldbthar01 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_146
Function Fragment_146()
;BEGIN CODE
;Enable the Bthalft Stand Clear trigger as soon as the player takes the crest.
DLC1LD_Bthalft.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_125
Function Fragment_125()
;BEGIN CODE
;Player picks up the fragment in Arkngthamz (and knows about Aetherium)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_135
Function Fragment_135()
;BEGIN CODE
;Katria leaves Raldbthar.
Alias_Katria.GetActorRef().EvaluatePackage()
(Alias_Katria.GetActorRef() as DLC1LD_GhostScript).KatriaTeleportingOut = True
(Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeOut()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_100
Function Fragment_100()
;BEGIN CODE
;Bthalft discovered via Change Location quest or Sketchbook Acquired (Stage 70)
;Debug.Trace("Revealed Bthalft")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_96
Function Fragment_96()
;BEGIN CODE
;Arkngthamz discovered via Change Location quest or Sketchbook Acquired (Stage 70)
;Debug.Trace("Revealed Arkngthamz")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_109
Function Fragment_109()
;BEGIN CODE
;Optional pointer to Katria's journal.
if (!GetStageDone(70))
     SetObjectiveDisplayed(135)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_97
Function Fragment_97()
;BEGIN CODE
;Raldbthar discovered via Change Location quest or Sketchbook Acquired (Stage 70)
;Debug.Trace("Revealed Raldbthar")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_127
Function Fragment_127()
;BEGIN CODE
;Bthalft Tower has finished rising.
DLC1LD_Bthalft.SetStage(28)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_126
Function Fragment_126()
;BEGIN CODE
;Begin raising the Bthalft tower.
(Alias_CrestPedestalTrig as DLC1LD_AetheriumPedestal).OpenBthalft()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_119
Function Fragment_119()
;BEGIN CODE
;Katria tells the player to use the Forge.
if (GetStageDone(130))
     SetObjectiveCompleted(210)
     if (!GetStageDone(221))
          SetObjectiveDisplayed(220)
     EndIf
     SetObjectiveDisplayed(225)
EndIf

;Silently give the player the fake Aetherium Crest they'll forge away.
;This slight of hand that prevents us from having to clear the 'Quest Object' flag on the real crest.
Game.GetPlayer().AddItem(Alias_CrestNP.GetReference(), 1, True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_95
Function Fragment_95()
;BEGIN CODE
;Player picks up Katria's Sketchbook.

;If the player was tasked with finding it, finish that objective.
if (IsObjectiveDisplayed(135))
     SetObjectiveCompleted(135)
EndIf

;See which locations the player has already discovered, and set the appropriate stages.
;Debug.Trace("Sketchbook acquired. Identifying discovered locations.")
if (MapMarkerArkngthamz.CanFastTravelToMarker())
     SetStage(71)
EndIf
if (MapMarkerRaldbthar.CanFastTravelToMarker())
     SetStage(72)
EndIf
if (MapMarkerDeepFolkCrossing.CanFastTravelToMarker())
     SetStage(73)
EndIf
if (MapMarkerMzulft.CanFastTravelToMarker())
     SetStage(74)
EndIf
if (MapMarkerBthalft.CanFastTravelToMarker())
     SetStage(75)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_138
Function Fragment_138()
;BEGIN CODE
;Katria leaves Deep Folk Crossing.
Alias_Katria.GetActorRef().EvaluatePackage()
  (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).KatriaTeleportingOut = True
(Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeOut()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_140
Function Fragment_140()
;BEGIN CODE
;Forgemaster turns on the steam. Display the objective to turn it off.
if (GetStageDone(130))
     SetObjectiveDisplayed(205)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_98
Function Fragment_98()
;BEGIN CODE
;Deep Folk Crossing discovered via Change Location quest or Sketchbook Acquired (Stage 70)
;Debug.Trace("Revealed Deep Folk Crossing")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_122
Function Fragment_122()
;BEGIN CODE
;Player crafts an item with the forge.
if (GetStageDone(130))
     SetObjectiveCompleted(220)
     SetObjectiveCompleted(225)
EndIf

;If the item is the crown, start the Postquest quest
;and swap it out for the Postquest quest's aliased version.
if (Game.GetPlayer().GetItemCount(DLC1LD_AetherialCrown) > 0)
     DLC1LD_Postquest.SetStage(0)
EndIf

;Notify DLC1LD_Bthalft of the crafting event.
DLC1LD_Bthalft.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_142
Function Fragment_142()
;BEGIN CODE
;In Arkngthamz, if the player has collected all four shards and Arkngthamz' is the last,
;make sure to complete the collection objective.
if (GetStageDone(130) && GetStageDone(20) && GetStageDone(30) && GetStageDone(40) && GetStageDone(50))
     SetObjectiveCompleted(130)
     SetObjectiveDisplayed(150)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_99
Function Fragment_99()
;BEGIN CODE
;Mzulft discovered via Change Location quest or Sketchbook Acquired (Stage 70)
;Debug.Trace("Revealed Mzulft")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_141
Function Fragment_141()
;BEGIN CODE
;Player turns off the steam.
if (GetStageDone(130))
     SetObjectiveCompleted(205)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_148
Function Fragment_148()
;BEGIN CODE
;Testing stage. Move to the Forge and set up for the boss battle with Katria.
SetStage(10)
SetStage(20)
SetStage(30)
SetStage(40)
SetStage(50)
SetStage(70)
SetStage(100)
SetStage(110)
SetStage(130)
SetStage(150)
Utility.Wait(1)
SetStage(6)
Utility.Wait(1)
SetStage(160)
SetStage(170)
SetStage(180)
SetStage(190)
DLC1LD_Bthalft.SetStage(0)
DLC1LD_Bthalft.SetStage(30)
Alias_Katria.GetActorRef().MoveTo(Game.GetPlayer())
Alias_Katria.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_120
Function Fragment_120()
;BEGIN CODE
;Restore the Wilderness Encounter trigger near Bthalft
BthalftWETrigger.Enable()

;Shut down the quest.
CompleteAllObjectives()
if (GetStageDone(100) || GetStageDone(110) || GetStageDone(130))
     CompleteQuest()
     Game.AddAchievement(54)
EndIf
DLC1LD_Misc.SetStage(255)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_88
Function Fragment_88()
;BEGIN CODE
;Player acquires Shard #3, in Deep Folk Crossing.

;If the shard hasn't been identified yet, display the identify objective.
if (!GetStageDone(10))
     DLC1LD_Misc.SetStage(40)
EndIf

If (GetStageDone(130))
     ;If the player has the quest, update the objective.
     ModObjectiveGlobal(1, DLC1LD_ShardsFound, 130, DLC1LD_ShardsTotal.GetValue())
     ;Then update Katria's status. Two stages, this time.
     SetStage(143)
     SetStage(144)
Else
     ;If the quest hasn't been displayed yet, update the global silently.
     DLC1LD_ShardsFound.Mod(1)
     UpdateCurrentInstanceGlobal(DLC1LD_ShardsFound)
EndIf

;If the player has all four shards, display the Bthalft objective.
if (GetStageDone(20) && GetStageDone(30) && GetStageDone(40) && GetStageDone(50))
     SetStage(150)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_77
Function Fragment_77()
;BEGIN CODE
;Testing stage. Move to Shard #1, in Arkngthamz.
Game.GetPlayer().MoveTo(DLC1LD1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_105
Function Fragment_105()
;BEGIN CODE
;Player meets Katria and accepts her help.
;Complete the misc objective pointer to Arkngthamz, if it was running.
DLC1LD_Misc.SetStage(12)

;Display the 'Reach the Summit' objective.
SetObjectiveDisplayed(100)

;Set Katria as a teammate from here on out.
Alias_Katria.GetActorRef().SetPlayerTeammate(True, False)

;Make this quest active as a courtesy.
SetActive(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_104
Function Fragment_104()
;BEGIN CODE
;Player speaks to Katria at the summit of Arkngthamz; she followed him.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_110
Function Fragment_110()
;BEGIN CODE
;Player has located all four shards, and is directed to Bthalft.
if (GetStageDone(100) || GetStageDone(110) || GetStageDone(130))
     if (GetStageDone(130))
           SetObjectiveDisplayed(150)
     EndIf
Else
     ;If the player gets this far without speaking to Katria, they never will.
     DLC1LD_Arkngthamz.SetStage(255)
EndIf

;Disable the Wilderness Encounter near Bthalft to prevent interference.
BthalftWETrigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Testing stage. Add the quest start book to the player's inventory.
Game.GetPlayer().AddItem(DLC1LD_QuestBook, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_108
Function Fragment_108()
;BEGIN CODE
;Player completes Arkngthamz, Katria sends them to search for the shards.
SetObjectiveCompleted(100)
SetObjectiveCompleted(125)
SetObjectiveDisplayed(130)

;If Katria isn't already the player's teammate, set that flag.
Alias_Katria.GetActorRef().SetPlayerTeammate(True, False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_118
Function Fragment_118()
;BEGIN CODE
;Forgemaster Battle ends. Direct the player to Katria.
if (GetStageDone(130))
     SetObjectiveCompleted(200)
     SetObjectiveDisplayed(210)
Else
     SetStage(220)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_145
Function Fragment_145()
;BEGIN CODE
;Complete objective to turn off the steam.
if (GetStageDone(130))
     SetObjectiveCompleted(195)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_115
Function Fragment_115()
;BEGIN CODE
;Player stands clear. Bthalft Rising continues.
if (GetStageDone(130))
     SetObjectiveCompleted(170)
     SetObjectiveCompleted(175)
     SetObjectiveCompleted(180)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
;Testing stage. Move to the Bthalft Exterior.
Game.GetPlayer().MoveTo(DLC1LD5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_117
Function Fragment_117()
;BEGIN CODE
;Forge battle begins. Display objective to defeat the guardians.
if (GetStageDone(130))
     SetObjectiveDisplayed(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_80
Function Fragment_80()
;BEGIN CODE
;Testing stage. Move to Shard #3, in Deep Folk Crossing.
Game.GetPlayer().MoveTo(DLC1LD3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_147
Function Fragment_147()
;BEGIN CODE
;Failsafe: If the player fast-travels away during the 'Stand Clear' objective, complete it
;when they return to Bthalft.
DLC1LD_Bthalft.SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_136
Function Fragment_136()
;BEGIN CODE
;Player acquires the shard in Deep Folk Crossing.
;Start this event: in Deep Folk, Katria just materializes behind the player for a dialogue.
Alias_Katria.GetActorRef().Disable()
Alias_Katria.GetActorRef().MoveTo(KatriaDeepFolkEndMarker)
(Alias_Katria.GetActorRef() as DLC1LD_GhostScript).KatriaTeleportingOut = False
(Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
Alias_Katria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_133
Function Fragment_133()
;BEGIN CODE
;Player approaches the shard in Mzulft zCell.
if (!GetStageDone(147))
  if (GetStageDone(140))
       SetStage(141)
       SetStage(142)
  EndIf
  if (GetStageDone(143))
       SetStage(144)
       SetStage(145)
  EndIf
  
  ;Start this event: in Mzulft, Katria warps in and plays a scene.
  Alias_Katria.GetActorRef().Disable()
  Alias_Katria.GetActorRef().MoveTo(KatriaMzulftStartMarker)
  (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).KatriaTeleportingOut = False
  (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
  Alias_Katria.GetActorRef().EvaluatePackage()
  DLC1LD_MzulftScene1.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_103
Function Fragment_103()
;BEGIN CODE
;Player learns about the Tonal Lock from Katria.
SetObjectiveCompleted(100)
SetObjectiveDisplayed(110)

;If Katria isn't already the player's teammate, set that flag.
Alias_Katria.GetActorRef().SetPlayerTeammate(True, False)

;Fork to 111 or 112, depending on whether Katria followed the player.
if (!DLC1LD_Arkngthamz.GetStageDone(30))
     SetStage(111)
Else
     SetStage(112)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_86
Function Fragment_86()
;BEGIN CODE
;Player acquires Shard #1, in Arkngthamz.

;Complete the misc objective pointer to Arkngthamz, if it was running.
DLC1LD_Misc.SetStage(12)

;If the shard hasn't been identified yet, display the identify objective.
;Omitted for Stage 10 - Katria will virtually always explain it to you, unless you're deliberately avoiding here.

If (GetStageDone(130))
     ;If the player has the quest, update the objective.
     ModObjectiveGlobal(1, DLC1LD_ShardsFound, 130, DLC1LD_ShardsTotal.GetValue())
Else
     ;If the quest hasn't been displayed yet, update the global silently.
     DLC1LD_ShardsFound.Mod(1)
     UpdateCurrentInstanceGlobal(DLC1LD_ShardsFound)
EndIf

;If the player has all four shards, display the Bthalft objective.
if (GetStageDone(20) && GetStageDone(30) && GetStageDone(40) && GetStageDone(50))
     SetStage(150)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_132
Function Fragment_132()
;BEGIN CODE
;Player approaches the shard in Deep Folk Crossing.
if (!GetStageDone(144))
  ;Wipe out any other running events.
  if (GetStageDone(140))
       SetStage(141)
       SetStage(142)
  EndIf
  if (GetStageDone(146))
       SetStage(147)
       SetStage(148)
  EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_107
Function Fragment_107()
;BEGIN CODE
;Player solves the Tonal Lock puzzle atop Arkngthamz.
if (IsObjectiveDisplayed(110))
     SetObjectiveCompleted(110)
     SetObjectiveDisplayed(120)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_85
Function Fragment_85()
;BEGIN CODE
;Player has read a copy of the quest book or otherwise heard of Aetherium.

;Force shards into their 'identified' aliases.
Alias_NameShard1.ForceRefTo(Alias_Shard1.GetReference())
Alias_NameShard2.ForceRefTo(Alias_Shard2.GetReference())
Alias_NameShard3.ForceRefTo(Alias_Shard3.GetReference())
Alias_NameShard4.ForceRefTo(Alias_Shard4.GetReference())

;Complete the 'identify' objective, if it's running.
DLC1LD_Misc.SetStage(10)

;Point the player to Arkngthamz if they haven't met Katria yet.
if (!GetStageDone(100))
     DLC1LD_Misc.SetStage(11)
EndIf

;If the player already has all four shards, point them to the Forge.
if (GetStageDone(20) && GetStageDone(30) && GetStageDone(40) && GetStageDone(50))
     SetStage(150)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_87
Function Fragment_87()
;BEGIN CODE
;Player acquires Shard #2, in Raldbthar.

;If the shard hasn't been identified yet, display the identify objective.
if (!GetStageDone(10))
     DLC1LD_Misc.SetStage(30)
EndIf

If (GetStageDone(130))
     ;If the player has the quest, update the objective.
     ModObjectiveGlobal(1, DLC1LD_ShardsFound, 130, DLC1LD_ShardsTotal.GetValue())
     ;Then update Katria's status.
     SetStage(141)
Else
     ;If the quest hasn't been displayed yet, update the global silently.
     DLC1LD_ShardsFound.Mod(1)
     UpdateCurrentInstanceGlobal(DLC1LD_ShardsFound)
EndIf

;If the player has all four shards, display the Bthalft objective.
if (GetStageDone(20) && GetStageDone(30) && GetStageDone(40) && GetStageDone(50))
     SetStage(150)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_116
Function Fragment_116()
;BEGIN CODE
;Bthalft Rising scene complete. Player is directed to enter Bthalft.
if (GetStageDone(130))
     SetObjectiveDisplayed(190)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_123
Function Fragment_123()
;BEGIN CODE
;Player picks up the fragment in Arkngthamz.

if (IsObjectiveDisplayed(120))
      SetObjectiveCompleted(120)
      SetObjectiveDisplayed(125)
EndIf

if (GetStageDone(10))
     SetStage(126)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_89
Function Fragment_89()
;BEGIN CODE
;Player acquires Shard #4, in Mzulft zCell.

;If the shard hasn't been identified yet, display the identify objective.
if (!GetStageDone(10))
     DLC1LD_Misc.SetStage(50)
EndIf

If (GetStageDone(130))
     ;If the player has the quest, update the objective.
     ModObjectiveGlobal(1, DLC1LD_ShardsFound, 130, DLC1LD_ShardsTotal.GetValue())
     ;Then update Katria's status.
     SetStage(147)
Else
     ;If the quest hasn't been displayed yet, update the global silently.
     DLC1LD_ShardsFound.Mod(1)
     UpdateCurrentInstanceGlobal(DLC1LD_ShardsFound)
EndIf

;If the player has all four shards, display the Bthalft objective.
if (GetStageDone(20) && GetStageDone(30) && GetStageDone(40) && GetStageDone(50))
     SetStage(150)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_111
Function Fragment_111()
;BEGIN CODE
;Outside Bthalft, player is directed to speak to Katria.
if (GetStageDone(130))
     if (!IsObjectiveCompleted(135))
          SetObjectiveDisplayed(135, False)
     EndIf
     SetObjectiveCompleted(150)
     SetObjectiveDisplayed(160)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_144
Function Fragment_144()
;BEGIN CODE
;Player enters the Forge.
;Complete objective to find the forge, show objective to turn off the steam.
if (GetStageDone(130))
     SetObjectiveCompleted(190)
     SetObjectiveDisplayed(195)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_112
Function Fragment_112()
;BEGIN CODE
;Katria tells the player to place the shards on the pedestal.
if (GetStageDone(130))
     SetObjectiveCompleted(160)
     SetObjectiveDisplayed(170)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_134
Function Fragment_134()
;BEGIN CODE
;Player acquires the shard in Raldbthar.
DLC1LD_RaldbtharScene1.Stop()
Alias_Katria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_128
Function Fragment_128()
;BEGIN CODE
;Player places the last shard. Start a countdown before Katria solves the last step.
DLC1LD_Bthalft.SetStage(15)

if (GetStageDone(130))
     if (!IsObjectiveCompleted(160))
          SetObjectiveDisplayed(160, False)
     EndIf
     SetObjectiveCompleted(170)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
;Testing stage. Move to the Forge.
Game.GetPlayer().MoveTo(DLC1LD6)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_114
Function Fragment_114()
;BEGIN CODE
;Player obtains the completed crest. Begin Bthalft Rising.
if (GetStageDone(130))
     SetObjectiveDisplayed(180)
EndIf

;Call to DLC1LD_Bthalft to handle the Bthalft Rising sequence.
DLC1LD_Bthalft.SetStage(21)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_113
Function Fragment_113()
;BEGIN CODE
;Player has placed all of the shards onto the pedestal.
if (GetStageDone(130))
     SetObjectiveCompleted(170)
     SetObjectiveCompleted(175)
EndIf

;They receive the Crest.
Game.GetPlayer().AddItem(Alias_Crest.GetReference())

;Ready to begin Bthalft Rising
SetStage(181)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_139
Function Fragment_139()
;BEGIN CODE
;Katria leaves Mzulft zCell.
Alias_Katria.GetActorRef().EvaluatePackage()
(Alias_Katria.GetActorRef() as DLC1LD_GhostScript).KatriaTeleportingOut = True
(Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeOut()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_137
Function Fragment_137()
;BEGIN CODE
;Player acquires the shard in Mzulft zCell.
DLC1LD_MzulftScene1.Stop()
Alias_Katria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_79
Function Fragment_79()
;BEGIN CODE
;Testing stage. Move to Shard #2, in Raldbthar02.
Game.GetPlayer().MoveTo(DLC1LD2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_130
Function Fragment_130()
;BEGIN CODE
;Player retrieves the crafting materials from the chest.
if (GetStageDone(130))
     SetObjectiveCompleted(220)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_131
Function Fragment_131()
;BEGIN CODE
;Player approaches the shard in Raldbthar.

if (!GetStageDone(141))
  ;Wipe out any other running events.
  if (GetStageDone(143))
       SetStage(144)
       SetStage(145)
  EndIf
  if (GetStageDone(146))
       SetStage(147)
       SetStage(148)
  EndIf

  ;Start this event: in Raldbthar, Katria fades in, we enable some enemies, and we trigger a scene.
  RaldbtharEnemiesEnableMarker.Enable(False)
  Alias_Katria.GetActorRef().Disable()
  Alias_Katria.GetActorRef().MoveTo(KatriaRaldbtharStartMarker)
  (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).KatriaTeleportingOut = False
  (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
  Alias_Katria.GetActorRef().EvaluatePackage()
  DLC1LD_RaldbtharScene1.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
;Testing stage. Move to Shard #4, in Mzulft zCell.
Game.GetPlayer().MoveTo(DLC1LD4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_106
Function Fragment_106()
;BEGIN CODE
;Player speaks to Katria at the summit of Arkngthamz; she didn't follow him.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_129
Function Fragment_129()
;BEGIN CODE
;Callback from DLC1LD_Bthalft. Katria tells the player to take the crest.
if (GetStageDone(130))
     SetObjectiveDisplayed(175)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property DLC1LD_BookQuest  Auto  

Explosion Property ExplosionIllusionLight01  Auto  

MiscObject Property DLC1LD_AetheriumSeal  Auto  

MiscObject Property DLC1LD_AetheriumFragment  Auto  

ObjectReference Property DLC1LD1  Auto  

Book Property DLC1LD_QuestBook  Auto  

ObjectReference Property DLC1LD2  Auto  

ObjectReference Property DLC1LD3  Auto  

ObjectReference Property DLC1LD4  Auto  

ObjectReference Property DLC1LD5  Auto  

ObjectReference Property DLC1LD6  Auto  

Quest Property DLC1LD_Misc  Auto  

GlobalVariable Property DLC1LD_ShardsFound  Auto  

GlobalVariable Property DLC1LD_ShardsTotal  Auto  

ObjectReference Property MapMarkerMzulft  Auto  

ObjectReference Property MapMarkerBthalft  Auto  

ObjectReference Property MapMarkerRaldbthar  Auto  

ObjectReference Property MapMarkerDeepFolkCrossing  Auto  

ObjectReference Property MapMarkerArkngthamz  Auto  

Quest Property DLC1LD_Postquest  Auto  

Quest Property DLC1LD_Arkngthamz  Auto  

Quest Property DLC1LD_Bthalft  Auto    

Armor Property DLC1LD_AetherialCrown  Auto  

ObjectReference Property KatriaRaldbtharStartMarker  Auto  

ObjectReference Property KatriaRaldbtharEndMarker  Auto  

ObjectReference Property KatriaDeepFolkEndMarker  Auto  

ObjectReference Property KatriaMzulftStartMarker  Auto  

ObjectReference Property KatriaMzulftEndMarker  Auto  

ObjectReference Property RaldbtharEnemiesEnableMarker  Auto  

Scene Property DLC1LD_RaldbtharScene1  Auto  

Scene Property DLC1LD_MzulftScene1  Auto  

ObjectReference Property BthalftWETrigger  Auto  
