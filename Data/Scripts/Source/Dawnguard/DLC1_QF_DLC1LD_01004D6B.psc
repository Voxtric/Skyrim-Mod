;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 82
Scriptname DLC1_QF_DLC1LD_01004D6B Extends Quest Hidden

;BEGIN ALIAS PROPERTY KatriaBow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KatriaBow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KatriaCorpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KatriaCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KatriaHeadTrackTargetPuzzleChamber
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KatriaHeadTrackTargetPuzzleChamber Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KatriaHeadTrackTargetMainChamber
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KatriaHeadTrackTargetMainChamber Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Katria
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Katria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KatriaHeadTrackTargetSideDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KatriaHeadTrackTargetSideDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1LD_ArkngthamzAdventurer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1LD_ArkngthamzAdventurer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GhostlyVoice01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GhostlyVoice01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Shard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Shard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PuzzleScrap
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PuzzleScrap Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GhostlyVoice02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GhostlyVoice02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
;Scene Stage 3c/4 (Sketchbook Reminder)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
if (GetStageDone(30))
    (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget4)
     if (!DLC1LD.GetStageDone(70))
          DLC1LD_03c_SketchbookReminder.Start()
     Else
          DLC1LD_04_KatriaCommentPassage.Start()
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_79
Function Fragment_79()
;BEGIN CODE
;Topic flag: Player persuades Katria to help them.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
;Scene Stage 8 (Opened Door)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
if (GetStageDone(30))
    (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget8)
     if (!Alias_Katria.GetActorRef().IsInCombat())
          DLC1LD_08_KatriaCommentSealedDoorSuccess.Start()
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_56
Function Fragment_56()
;BEGIN CODE
;Scene Stage 12 (Final Chamber)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
if (GetStageDone(30))
    (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget12)
     DLC1LD_12a_KatriaCommentFinalChamber.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Trigger Katria Initial Forcegreet when her scene ends.
Alias_Katria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_46
Function Fragment_46()
;BEGIN CODE
;Scene Stage 3d (Sketchbook Reminder)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
if (GetStageDone(30))
     if (!DLC1LD.GetStageDone(70))
          DLC1LD_03d_SketchbookTaunt.Start()
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_54
Function Fragment_54()
;BEGIN CODE
;Scene Stage 11a (Bow Chamber)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
DoorSuccessTrigger.Disable()
if (GetStageDone(30))
    (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget11)
     DLC1LD_11a_KatriaCommentBow.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_75
Function Fragment_75()
;BEGIN CODE
;Scene flag: Katria puzzle scene complete.
Alias_Katria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player enters the main chamber of Arkngthamz.
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()

;For effect, try to move Katria in behind the player.
Alias_Katria.GetActorRef().MoveTo(Game.GetPlayer(), 200, 0, 0)
if (Game.GetPlayer().HasLOS(Alias_Katria.GetActorRef()))
     Alias_Katria.GetActorRef().MoveTo(Game.GetPlayer(), 200, 200, 0)
EndIf
if (Game.GetPlayer().HasLOS(Alias_Katria.GetActorRef()))
     Alias_Katria.GetActorRef().MoveTo(Game.GetPlayer(), 200, -200, 0)
EndIf
if (Game.GetPlayer().HasLOS(Alias_Katria.GetActorRef()))
     ;Failing that, just start Katria at her editor loc. That works, too.
     Alias_Katria.GetActorRef().MoveTo(KatriaStart)
EndIf

;Katria fades in and plays her intro scene.
(Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
DLC1LD_01KatriaIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
;Scene Stage 5 (Falmer Up Ahead)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
if (GetStageDone(30))
    (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget5)
     if (!Alias_Katria.GetActorRef().IsInCombat())
          DLC1LD_05_KatriaCommentMoreFalmer.Start()
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_63
Function Fragment_63()
;BEGIN CODE
;Offer Katria Clue #3: Look for a pattern.
DLC1LD_13c_KatriaTip3.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
;Offer Katria Clue #4: Just wing it.
DLC1LD_13d_KatriaTip4.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_71
Function Fragment_71()
;BEGIN CODE
;Topic flag: Player asks Katria about dangers in Arkngthamz.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_48
Function Fragment_48()
;BEGIN CODE
;Scene Stage 6 (Quite a Place)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
if (GetStageDone(30))
    (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget6)
     if (!Alias_Katria.GetActorRef().IsInCombat())
          DLC1LD_06_KatriaCommentQuiteAPlace.Start()
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
;Katria's Body Platform.
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
If (!GetStageDone(30))
     ;Scene 3a (Journal from Distance)
     DLC1LD_03a_KatriaCommentBody.Start()
Else
     ;Scene 3b (Journal Following)
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget3b)
     DLC1LD_03b_KatriaCommentBody.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_67
Function Fragment_67()
;BEGIN CODE
;Topic flag: Player asks Katria about her story before reading the book.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;Tonal Lock puzzle introduced. Player must solve it to proceed.
DLC1LD.SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
;Player solves the puzzle.

;Katria reacts and heads for the treasure.
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
DLC1LD_14_KatriaCommentGotIt.Start()
Alias_Katria.GetActorRef().EvaluatePackage()

;Update objectives.
DLC1LD.SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_70
Function Fragment_70()
;BEGIN CODE
;Katria comments if the player strips the armor from her body.
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
DLC1LD_03e_KatriaCommentBodyStripped.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_68
Function Fragment_68()
;BEGIN CODE
;Topic flag: Katria has introduced herself.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_69
Function Fragment_69()
;BEGIN CODE
;Topic flag: Katria has told the player about the Forge.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest starts when you enter Arkngthamz.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_76
Function Fragment_76()
;BEGIN CODE
;Scene Stage 4b (Kinetic Resonator)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
if (GetStageDone(30))
    (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget4b)
     if (!Alias_Katria.GetActorRef().IsInCombat())
          DLC1LD_04b_KatriaCommentResonator.Start()
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
;Scene Stage 7 (Open the Door)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
if (GetStageDone(30))
     if (!Alias_Katria.GetActorRef().IsInCombat())
         (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeOut()
         (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).MoveTo(KatriaMoveTarget7)
         (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
     EndIf
     if (!Alias_Katria.GetActorRef().IsInCombat())
         DLC1LD_07_KatriaCommentSealedDoor.Start()
         (DoorSuccessTrigger as DLC1LD_DoorTriggerToggleScript).EnableDoorTrigger()
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Set up for final chamber forcegreet. Move Katria if she stayed behind.
if (GetStageDone(30))
     if (Game.GetPlayer().GetDistance(KatriaMoveTarget13) > 768)
         Debug.Trace("VAR 1")
         (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(Game.GetPlayer())
     Else
         Debug.Trace("VAR 2")
         (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget13)
     EndIf
Else
     if (Game.GetPlayer().GetDistance(KatriaPuzzleChairMarker) > 768)
          Debug.Trace("VAR 3")
          Alias_Katria.GetActorRef().Disable(False)
          Alias_Katria.GetActorRef().MoveTo(Game.GetPlayer())
          (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeInNoWait()
          Utility.Wait(0.5)
          SetStage(77)
          DLC1LD_12b_KatriaCommentImpressed.Start()
     Else
          Debug.Trace("VAR 4")
          SetStage(76)
          Alias_Katria.GetActorRef().Disable()
          Alias_Katria.GetActorRef().EvaluatePackage()
          Alias_Katria.GetActorRef().MoveToPackageLocation()
          (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
          SetStage(77)
          DLC1LD_12b_KatriaCommentImpressed.Start()
     EndIf
EndIf
SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Katria exit forcegreet.
DLC1LD.SetStage(125)
Alias_Katria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
;Katria is fading out. Prevent further forcegreets or activations.
(Alias_Katria.GetActorRef() as DLC1LD_GhostScript).KatriaTeleportingOut = True
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_73
Function Fragment_73()
;BEGIN CODE
;Package flag: Move Katria to her seated position near the puzzle.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_80
Function Fragment_80()
;BEGIN CODE
;Failsafe: If Stage 22 (Katria Forcegreet) hasn't been set yet, warp Katria out ahead of the player.
if (!GetStageDone(22))
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeOut()
     Alias_Katria.GetActorRef().MoveTo(KatriaMoveTarget3)
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeIn()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;Scene flag: player takes Katria's bow.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_65
Function Fragment_65()
;BEGIN CODE
;Katria scene in front of the treasure.
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
DLC1LD_15_KatriaCommentTreasure.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
;Scene Stage 10 (Big Drop)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
if (GetStageDone(30))
    (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget10)
     DLC1LD_10_KatriaCommentDrop.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;Shut down the quest.
Alias_Katria.GetActorRef().BlockActivation(True)
(Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeOut()
Alias_Katria.GetActorRef().BlockActivation(False)
DLC1LD.SetStage(131)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_72
Function Fragment_72()
;BEGIN CODE
;Trigger final chamber forcegreet (long radius).
if (Alias_Katria.GetActorRef().GetDistance(Game.GetPlayer()) > 2048)
     Alias_Katria.GetActorRef().Disable(False)
     Alias_Katria.GetActorRef().MoveTo(Game.GetPlayer())
     (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).FadeInNoWait()
EndIf
Alias_Katria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_66
Function Fragment_66()
;BEGIN CODE
;Katria exit forcegreet reentry.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
;Scene Stage 9 (Drop Pods)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
if (GetStageDone(30))
    (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget9)
     DLC1LD_09_KatriaCommentPods.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_61
Function Fragment_61()
;BEGIN CODE
;Offer Katria Clue #2: Get the Scrap of Paper.
if (!GetStageDone(74))
     DLC1LD_13b_KatriaTip2.Start()
Else
     ;Proceed to the next clue.
     SetStage(88)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Katria begins following the player.
Alias_Katria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;Player leaving entry hall. Fade out Katria cursing scene.
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
DLC1LD_00KatriaPleading02.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_78
Function Fragment_78()
;BEGIN CODE
;Topic flag: Player asks Katria what she was doing here.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
;Offer Katria Clue #1: Get the Sketchbook.
if (!DLC1LD.GetStageDone(70))
     DLC1LD_13a_KatriaTip1.Start()
Else
     ;Proceed to the next clue.
     SetStage(87)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_74
Function Fragment_74()
;BEGIN CODE
;Scene flag: Katria puzzle scene started.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
;Player tries to leave the dungeon with Katria in tow. Trigger exit scene (first time only).
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
DLC1LD_02KatriaBackout.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;Player in entry hall. Start Katria pleading scene 1.
DLC1LD_00KatriaPleading.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
;Flag: Player picks up the scrap of paper with the puzzle clue on it.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
;Scene Stage 11b (Bow Pickup)
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
if (GetStageDone(30))
    (Alias_Katria.GetActorRef() as DLC1LD_GhostScript).CatchUp(KatriaMoveTarget11b)
     DLC1LD_11b_KatriaCommentBowPickup.Start()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Player declines Katria's help or backs out of dialogue. She waits by the entrance until stage 50.
Alias_Katria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
;Trigger final chamber forcegreet (short radius).
Alias_Katria.GetActorRef().EvaluatePackage()
Utility.Wait(10)
if (!GetStageDone(85))
     SetStage(81)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Katria is in initial dialogue.
((Self as Quest) as DLC1LD_D2QuestScript).StopScenes()
Alias_Katria.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC1LD_00KatriaPleading Auto
Scene Property DLC1LD_00KatriaPleading02 Auto
Scene Property DLC1LD_01KatriaIntro Auto
Scene Property DLC1LD_02KatriaBackout Auto
Scene Property DLC1LD_03a_KatriaCommentBody Auto
Scene Property DLC1LD_03b_KatriaCommentBody Auto
Scene Property DLC1LD_03c_SketchbookReminder Auto
Scene Property DLC1LD_03d_SketchbookTaunt Auto
Scene Property DLC1LD_03e_KatriaCommentBodyStripped Auto
Scene Property DLC1LD_04_KatriaCommentPassage Auto
Scene Property DLC1LD_04b_KatriaCommentResonator Auto
Scene Property DLC1LD_05_KatriaCommentMoreFalmer Auto
Scene Property DLC1LD_06_KatriaCommentQuiteAPlace Auto
Scene Property DLC1LD_07_KatriaCommentSealedDoor Auto
Scene Property DLC1LD_08_KatriaCommentSealedDoorSuccess Auto
Scene Property DLC1LD_09_KatriaCommentPods Auto
Scene Property DLC1LD_10_KatriaCommentDrop Auto
Scene Property DLC1LD_11a_KatriaCommentBow Auto
Scene Property DLC1LD_11b_KatriaCommentBowPickup Auto
Scene Property DLC1LD_12a_KatriaCommentFinalChamber Auto
Scene Property DLC1LD_12b_KatriaCommentImpressed Auto
Scene Property DLC1LD_13a_KatriaTip1 Auto
Scene Property DLC1LD_13b_KatriaTip2 Auto
Scene Property DLC1LD_13c_KatriaTip3 Auto
Scene Property DLC1LD_13d_KatriaTip4 Auto
Scene Property 	DLC1LD_14_KatriaCommentGotIt Auto
Scene Property 	DLC1LD_15_KatriaCommentTreasure Auto





Quest Property DLC1LD  Auto  
ObjectReference Property KatriaStart  Auto  

ObjectReference Property KatriaPuzzleChairMarker  Auto  

ObjectReference Property KatriaMoveTarget3b  Auto  

ObjectReference Property KatriaMoveTarget4  Auto  

ObjectReference Property KatriaMoveTarget5  Auto  

ObjectReference Property KatriaMoveTarget6  Auto  

ObjectReference Property KatriaMoveTarget7  Auto  

ObjectReference Property KatriaMoveTarget8  Auto  

ObjectReference Property KatriaMoveTarget9  Auto  

ObjectReference Property KatriaMoveTarget10  Auto  

ObjectReference Property KatriaMoveTarget11  Auto  

ObjectReference Property KatriaMoveTarget11b  Auto  

ObjectReference Property KatriaMoveTarget12  Auto  

ObjectReference Property KatriaMoveTarget13  Auto  

ObjectReference Property DoorSuccessTrigger  Auto  

ObjectReference Property KatriaMoveTarget4b  Auto  

ObjectReference Property KatriaMoveTarget3  Auto  
