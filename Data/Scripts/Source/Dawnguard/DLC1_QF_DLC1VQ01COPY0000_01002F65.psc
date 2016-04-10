;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname DLC1_QF_DLC1VQ01COPY0000_01002F65 Extends Quest Hidden

;BEGIN ALIAS PROPERTY GargoyleAmbush
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GargoyleAmbush Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorVamp8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorVamp8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorVamp5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorVamp5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MainCastleDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MainCastleDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FortWorld
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FortWorld Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorVamp7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorVamp7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Harkon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Harkon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Isran
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Isran Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Agmaer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Agmaer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorVamp2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorVamp2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vingalmo
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vingalmo Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tolan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tolan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boat
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boat Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorVamp1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorVamp1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PulledLever
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PulledLever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Deathhound1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Deathhound1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorVamp3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorVamp3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TargetLever
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TargetLever Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorVamp6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorVamp6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Serana
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Serana Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorVamp9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorVamp9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpectatorVamp4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpectatorVamp4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Deathhound2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Deathhound2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DungeonExit
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DungeonExit Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DimhollowCryptLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DimhollowCryptLocation Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Completed and on to Hunter intro
SetObjectiveCompleted(30,1)
DLC1HunterBaseIntro.SetStage(20)
MM.SetHomeMarker(1)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Player accepted choice has been bitten and moved to coffin room

;Shut down HunterBaseIntro
;DLC1HunterBaseIntro.SetStage(255)

;Disable the castle gate guard
DLC1VampireCastleGuardRef.Disable()

;Start the tutorial quest
DLC1VampireTutorial.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player has refused the blood of Harkon
SetObjectiveCompleted(20,1)
SetObjectiveCompleted(30,1)

;Set stage 20 in the Hunter base intro quest
DLC1HunterBaseIntro.SetStage(20)
DLC1HunterBaseIntro.SetActive()

;Close the castle gate and disable the guard
DLC1VQCastleGuard.SetStage(30)

;Check if the player has follower and/or animal follower and boot them out too
if Follower
	Follower.GetActorReference().MoveTo(game.getPlayer())
endif
if FollowerAnimal
	FollowerAnimal.GetActorReference().MoveTo(game.getPlayer())
endif
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Player enters the vampire castle

; no blasters! and no pickpocketing!
Game.DisablePlayerControls(abMovement = false, abFighting = true, abCamSwitch = false, abLooking = false, abSneaking = true, abMenu = false, abActivate = false, abJournalTabs = false)

;enable menu
Game.EnablePlayerControls(abMovement = false, abFighting = false, abCamSwitch = false, abLooking = false, abSneaking = false, abMenu = true, abActivate = false, abJournalTabs = false)

;Serana leaves the follower alias
;(DialogueFollower as DialogueFollowerScript).DismissFollower()

;Stop combat on Serana, the castle guard and the player
Alias_Serana.GetActorRef().StopCombat()
Alias_Serana.GetActorRef().StopCombatAlarm()
DLC1VampireCastleGuard.StopCombat()
DLC1VampireCastleGuard.StopCombatAlarm()
Game.GetPlayer().StopCombat()
Game.GetPlayer().StopCombatAlarm()

;Call EVP on Serana
Alias_Serana.GetActorRef().EvaluatePackage()

;Start Castle entry scene
CastleController.LockdownBanquetHall()
CastleController.CleanSeranasRoom(False)
DLC1VQ02HarkonAndSeranaScene.Start()
Alias_Serana.GetActorRef().EvaluatePackage()

; try this - put drink in Harkon's hand
; put drink in his hand
Alias_Harkon.GetActorRef().PlayIdle(OffsetCarryMQ201DrinkR)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Completion stage and on to Vampire intro
SetObjectiveCompleted(20,1)
DLC1VampireBaseIntro.SetStage(10)
DLC1PlayingVampireLine.SetValue(1)
MM.SetHomeMarker(2)
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Move the player to the vampire castle door
Game.GetPlayer().MoveTo(DLC1VQ02PlayerStart)
;Move Serana to be next to the player at the vampire castle door
Alias_Serana.GetReference().MoveTo(DLC1VQ02SeranaStart)
;Set Stage 5, the normal quest start stage
SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
; put Serana into combat when gargoyle ambush is triggered so she doesn't "search" for them
Alias_GargoyleAmbush.GetActorRef().CreateDetectionEvent(Alias_GargoyleAmbush.GetActorRef(), 100)
Alias_Serana.GetActorRef().StartCombat(Alias_GargoyleAmbush.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Stage 20, player has been offered the choice
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Scene between Harkon & Serana is done, Harkon now will forcegreet the player
DLC1VQ02HarkonIntroWaitingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Startup Stage

;Make Serana the player's follower
;(DialogueFollower as DialogueFollowerScript).DismissFollower()
;(DialogueFollower as DialogueFollowerScript).SetFollower(SeranaRef)
MM.EngageFollowBehavior()
MM.IsWillingToWait = false

SetObjectiveDisplayed(10)
SetActive()

;Start the RNPC quest
DLC1VQ02RNPC.Start()

; show map marker
;CastleMapMarker.AddToMap()
; enable first section of Fort Dawnguard exterior
DLC1HunterHQEXTInitEnabled01.Disable() ; disable this because Ryan is weird
; put Agmaer in Dawnguard outfit
Alias_Agmaer.GetActorRef().SetOutfit(DLC1OutfitAgmaer)
Alias_Agmaer.GetActorRef().AddItem(DLC1DawnguardAxe, 1)

;BlockActivate on the Door so your follower cannot enter
;	A script added through the castle controller allows the player/Serana to bypass this
alias_MainCastleDoor.getReference().BlockActivation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Arrival at vampire castle, player must speak to Harkon
;(DialogueFollower as DialogueFollowerScript).DismissFollower()
MM.DisengageFollowBehavior()
MM.IsWillingToWait = true
MM.CanFollow = false
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Player has spoken to Isran after freeing Serana
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Harkon Turned into Lord form to convince player
;Will forcegreet player
DLC1VQ02HarkonIntroWaitingScene.Stop() ; just in case
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Shutdwn stage

if (DLC1PlayingVampireLine.GetValue() == 1)
     MM.SetHomeMarker(2)
else
     MM.SetHomeMarker(1)
endif

;Unlock the guidhall
CastleController.UnlockBanquetHall()

; allow weapons again - leave everything else the way it was (which is presumably enabled)
Game.EnablePlayerControls(abMovement = false, abFighting = true, abCamSwitch = false, abLooking = false, abSneaking = true, abMenu = false, abActivate = false, abJournalTabs = false)

; disable feast marker
DLC1VQ02FeastEnableMarker.Disable()

; enable thrall feeding NPCs
DLC1VCTableThrallEnableParent.Enable()

;Unblock Activate on the Door allowing Traversal at appropriate times
alias_MainCastleDoor.getReference().BlockActivation(False)

DLC1VQ02RNPC.Stop()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;
;SetStage(30)
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

Quest Property DialogueFollower  Auto  

ObjectReference Property SeranaRef  Auto  

Quest Property DLC1HunterBaseIntro  Auto  

Quest Property DLC1VampireBaseIntro  Auto  

ObjectReference Property DLC1VQ04PlayerStart  Auto  

ObjectReference Property DLC1VQ04RNPCTempStart  Auto

ObjectReference Property DLC1VQ02PlayerStart  Auto  

ObjectReference Property DLC1VQ02SeranaStart  Auto  

DLC1_NPCMentalModelScript Property MM Auto

Scene Property DLC1VQ02VingalmoGreet  Auto  

GlobalVariable Property DLC1PlayingVampireLine  Auto  

Quest Property DLC1VQ02RNPC  Auto  

Scene Property DLC1VQ02HarkonAndSeranaScene  Auto  

Quest Property DLC1VampireTutorial  Auto  

DLC1VampireCastleControllerScript Property CastleController auto

Quest Property DLC1VQCastleGuard  Auto  

ReferenceAlias Property Follower  Auto  

ReferenceAlias Property FollowerAnimal  Auto  

ObjectReference Property DLC1VampireCastleGuardRef  Auto  

ObjectReference Property CastleMapMarker  Auto  

ObjectReference Property DLC1HunterHQEXTInitEnabled01  Auto  
{disable this marker to turn on first part of Fort Dawnguard exterior}

Outfit Property DLC1OutfitAgmaer  Auto  

WEAPON Property DLC1DawnguardAxe  Auto  

Idle Property OffsetCarryMQ201DrinkR  Auto  

ObjectReference Property DLC1VQ02FeastEnableMarker  Auto  

ObjectReference Property CastleFrontDoor  Auto  

Scene Property DLC1VQ02HarkonIntroWaitingScene  Auto  
{scene for looping dialogue if player doesn't approach Harkon}

ObjectReference Property DLC1VCTableThrallEnableParent  Auto  
{enable marker for 24x7 thrall feeding NPCs}

Quest Property WerewolfQuest  Auto  

Actor Property DLC1VampireCastleGuard  Auto
