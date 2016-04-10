;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 26
Scriptname DLC1_QF_DLC1VQ05_01002850 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC1VQ05Keeper03Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05Keeper03Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05Keeper02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05Keeper02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05ValericaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05ValericaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05JumpPadPointerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05JumpPadPointerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05Keeper01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05Keeper01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05ESActivatorAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05ESActivatorAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05SoulCairn
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC1VQ05SoulCairn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05HoldingSafeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05HoldingSafeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05DurnehviirAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05DurnehviirAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05ElderScrollThreeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05ElderScrollThreeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05ReturnHomeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05ReturnHomeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ05RNPCAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ05RNPCAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Player has exited the Soul Cairn and is back in the catacombs
CompleteAllObjectives()
Game.AddAchievement(52)
pDLC1VQ05Post.Start()
DLC1VQ05RNPC.Stop()
MM.Unlock()
MM.EngageFollowBehavior()
MM.IsWillingToWait = true
MM.CanBeDismissed = true
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;If Player finishes killing all three Boneyard Keepers, pop this stage
;This is where the barrier is disabled and any art changes to barrier need to happen
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
if IsObjectiveDisplayed(30) == 1
SetObjectiveCompleted(30,1)
endif
Alias_DLC1VQ05ValericaAlias.GetActorRef().EvaluatePackage()
pDLC1VQ05BarrierEnableMarker.Disable()
SetObjectiveDisplayed(40,1)
pDLC1VQ05TravelModeOff.SetValue(1)
MM.EngageFollowBehavior()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Durnehviir is dead - Start Up the DLC1VQDragon Quest and Maintenance - Speak to Valerica
;Do dragon vanish FX here to disable
SetObjectiveCompleted(70,1)
SetObjectiveDisplayed(90,1)
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;After speaking to Valerica in Stage 25 - Pop new scene (DLC1VQ05MeetSceneSCDone)
pDLC1VQ05MeetSceneSC.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;When Player finds Valerica - set this stage (set after scene with RNPC)
SetObjectiveCompleted(10,1)
DLC1HunterHQCampInitEnabled.Disable()
if GetStageDone(25) == 0
pDLC1VQ05MeetScene.Start()
Alias_DLC1VQ05RNPCAlias.GetActorRef().SetPlayerTeammate(False)
pDLC1VQ05TravelModeOff.SetValue(1)
MM.DisengageFollowBehavior()
MM.CanFollow = false
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Got the Elder Scroll - Last talk with Valerica
SetObjectiveCompleted(100,1)
SetObjectiveDisplayed(110,1)
pDLC1VQElder.SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Post Meeting Scene, Start Valerica dialogue (Set at end of Scene)
SetObjectiveDisplayed(20,1)
Alias_DLC1VQ05ValericaAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Player has exited the Soul Cairn and is back in the catacombs
CompleteAllObjectives()
Game.AddAchievement(52)
pDLC1VQ05Post.Start()
DLC1VQ05RNPC.Stop()
MM.Unlock()
MM.EngageFollowBehavior()
MM.IsWillingToWait = true
MM.CanBeDismissed = true
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Valerica is Escorting Player to Scroll
pDLC1VQ05BoneyardDoorRef.Lock(false)
Alias_DLC1VQ05ValericaAlias.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Boneyard Trap Trigger Maintenance Stage
;This is temp stuff until we know exactly the proper positioning for Valerica and Durnehviir
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
if IsObjectiveDisplayed(40) == 1
SetObjectiveCompleted(40,1)
endif
if IsObjectiveDisplayed(50) == 1
SetObjectiveCompleted(50,1)
elseif IsObjectiveDisplayed(60) == 1
SetObjectiveCompleted(60,1)
endif
SetObjectiveDisplayed(70,1)
Alias_DLC1VQ05DurnehviirAlias.GetActorRef().Enable()
pDLC1Durnehviir.SetEssential(False)
pDLC1VQ05DragonAttackScene.Start()
pDLC1VQ05DragonFightShoutsScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player arrives in Soul Cairn - begin exploration
SetObjectiveDisplayed(10,1)
pDLC1VQ05DragonFight.Start()
pElderScrollBloodQI.ForceRefTo(Alias_DLC1VQ05ElderScrollThreeAlias.GetRef())
DLC1VQ05RNPC.Start()

MM.LockIn()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Return to Tamriel!
SetObjectiveCompleted(110,1)
SetObjectiveDisplayed(120,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug Fast Start
;Don't forget to StartQuest DLC1Init
Game.GetPlayer().MoveTo(pDLC1VQ05PlayerTempStartMarker)
Alias_DLC1VQ05RNPCAlias.GetActorRef().MoveTo(pDLC1VQ05RNPCTempStartMarker)
MM.EngageFollowBehavior()
MM.IsWillingToWait = false
Alias_DLC1VQ05RNPCAlias.GetActorRef().EvaluatePackage()
Alias_DLC1VQ05RNPCAlias.GetActorRef().SetPlayerTeammate()
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Valerica arrives at Scroll, drop the barrier around it or whatever - for now, enable it
SetObjectiveCompleted(95,1)
SetObjectiveDisplayed(100,1)
pDLC1VQ05ESChestRef.Activate(Alias_DLC1VQ05ValericaAlias.GetActorRef())
;Alias_DLC1VQ05ElderScrollThreeAlias.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;The SC Scene is over - Valerica final FG
Alias_DLC1VQ05ValericaAlias.GetActorRef().EvaluatePackage()
Alias_DLC1VQ05RNPCAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Follow Valerica to the Elder Scroll
Alias_DLC1VQ05ValericaAlias.GetActorRef().EvaluatePackage()
SetObjectiveCompleted(90,1)
SetObjectiveDisplayed(95,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;After Player has spoken to Valerica - pop this stage to go kill Keepers
;If Player already has killed 1 or 2 Keepers, update the Objective accordingly
;If Player already has killed 3 Keepers, skip this stage and go directly to 40
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
if pDLC1VQ05KeepersKilled.GetValue() == 0
SetObjectiveDisplayed(30,1)
elseif pDLC1VQ05KeepersKilled.GetValue() == 1
UpdateCurrentInstanceGlobal(pDLC1VQ05KeepersKilled)
SetObjectiveDisplayed(30,1)
elseif pDLC1VQ05KeepersKilled.GetValue() == 2
UpdateCurrentInstanceGlobal(pDLC1VQ05KeepersKilled)
SetObjectiveDisplayed(30,1)
elseif pDLC1VQ05KeepersKilled.GetValue() >= 3
SetStage(40)
endif
Alias_DLC1VQ05RNPCAlias.GetActorRef().SetPlayerTeammate()
pDLC1VQ05TravelModeOff.SetValue(0)
MM.EngageFollowBehavior()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
GlobalVariable Property pDLC1VQ05KeepersKilled  Auto  

Quest Property pDLC1VQ06Hunter  Auto  

Scene Property pDLC1VQ05MeetScene  Auto  

Quest Property pDLC1VQElder  Auto  

Scene Property pDLC1VQ05MeetSceneSC Auto

GlobalVariable Property pDLC1PlayerIsVampire  Auto  

DLC1VQ05QuestScript Property pDLC1VQ05QS  Auto  

ObjectReference Property pDLC1VQ05TempWallRef  Auto  

ObjectReference Property pDLC1VQ05RNPCTempStartMarker  Auto  

ObjectReference Property pDLC1VQ05PlayerTempStartMarker  Auto  

ObjectReference Property pDLC1VQ05ValericaCombatMarker  Auto  

Faction Property pDLC1ValericaFaction  Auto  

Faction Property pDLC1ValericaEnemyFaction  Auto  

GlobalVariable Property pDLC1VQ05TravelModeOff  Auto  

ActorBase Property pDLC1Durnehviir  Auto  

Quest Property pDLC1VQDragon  Auto  

DLC1_NPCMentalModelScript Property MM Auto

ObjectReference Property pDLC1VQ05ValericaMoveToMarker  Auto  

Scene Property pDLC1VQ05DragonAttackScene  Auto  

Scene Property pDLC1VQ05DragonFightShoutsScene  Auto  

Quest Property pDLC1VQ05Post  Auto  

ObjectReference Property pDLC1VQ05BarrierEnableMarker  Auto  

Quest Property pDLC1VQ05DragonFight  Auto  

Quest Property DLC1VQ05RNPC  Auto  

ObjectReference Property pDLC1VQ05ESChestRef  Auto  

ReferenceAlias Property pElderScrollBloodQI  Auto  

GlobalVariable Property pDLC1VQPlayingVampireLine  Auto  

ObjectReference Property pDLC1VQ05BoneyardDoorRef  Auto  

ObjectReference Property DLC1HunterHQCampInitEnabled  Auto  
