;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 25
Scriptname DLC1_QF_DLC1VQ06_01002852 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC1VQ06CanticleBark1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06CanticleBark1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06CanticleTreeAlias02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06CanticleTreeAlias02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06RNPCAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06RNPCAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1HoldingCellSafe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1HoldingCellSafe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06CanticleBark2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06CanticleBark2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06CanticleBark3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06CanticleBark3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06DiasMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06DiasMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06CanticleTreeAlias01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06CanticleTreeAlias01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06CanticleBark5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06CanticleBark5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06CanticleTreeAlias05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06CanticleTreeAlias05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06HoldingSafe
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06HoldingSafe Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06ReadingMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06ReadingMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06DrawKnifeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06DrawKnifeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06CanticleBark4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06CanticleBark4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06DrawKnifeQTAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06DrawKnifeQTAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06CanticleTreeAlias04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06CanticleTreeAlias04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQ06CanticleTreeAlias03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQ06CanticleTreeAlias03 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Quest Complete - Vision has been completed
pDLC1VQ04Portcullis.Activate(Alias_DLC1VQ06RNPCAlias.GetActorRef())
CompleteAllObjectives()
pDLC1VQ07.SetStage(10)
MM.Unlock()
MM.EngageFollowBehavior()
MM.IsWillingToWait = true
MM.CanBeDismissed = true
DLC1VQ06RNPC.Stop()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;DEBUG QUEST STAGE

;player fails to reads scroll
DLC1VQ06ReadTriggerRef.PlayerGoesBlind()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Got first cluster of moths, Serana says scene
pDLC1VQ06SeranaMothComment.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;DEBUG QUEST STAGE

;player successfully reads scroll
DLC1VQ06ReadTriggerRef.PlayerReadsScroll(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;DEBUG QUEST STAGE

;player successfully reads scroll
DLC1VQ06ReadTriggerRef.PlayerReadsScroll(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug Fast Start
;Don't forget to StartQuest DLC1Init
Game.GetPlayer().MoveTo(pDLC1VQ06PlayerStartMarker)
Alias_DLC1VQ06RNPCAlias.GetActorRef().Moveto(pDLC1VQ06RNPCStartMarker)
Alias_DLC1VQ06RNPCAlias.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddItem(pDLC1ElderScrollBlood,1)
Game.GetPlayer().AddItem(pDLC1ElderScrollDragon,1)
Game.GetPlayer().AddItem(pDLC1ElderScrollSun,1)
;Set to correct Factions
if DLC1PlayingVampireLine.getValue() == 1
	Game.GetPlayer().AddtoFaction(DLC1VampireFaction)
	DLC1Radiant.SetStage(10)
else
	Game.GetPlayer().AddtoFaction(DLC1HunterFaction)
endif
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Player picked up the Draw Knife from the Glade
pDLC1VQ04Portcullis.Activate(Alias_DLC1VQ06RNPCAlias.GetActorRef())
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
pDLC1VQ06SeranaKnifeComment.Start()
MM.SimpleFollow = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;DEBUG QUEST STAGE

;player successfully reads scroll
DLC1VQ06ReadTriggerRef.PlayerReadsScroll(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;DEBUG QUEST STAGE

;player successfully reads scroll
DLC1VQ06ReadTriggerRef.PlayerReadsScroll(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Done reading the scrolls! - Serana forcegreets
MM.SimpleFollow = false
MM.EngageFollowBehavior()
Game.EnablePlayerControls()
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(60,1)
pDLC1MothAttachFX01Effect.Stop(Game.GetPlayer())
pDLC1MothAttachFX01Effect.Stop(Game.GetPlayer())
pDLC1MothAttachFX01Effect.Stop(Game.GetPlayer())
pDLC1MothAttachFX01Effect.Stop(Game.GetPlayer())
pDLC1MothAttachFX01Effect.Stop(Game.GetPlayer())
;Trigger Ambush as the player leaves
if DLC1PlayingVampireLine.getValue() == 1
	DLC1VQ06DawnguardAttackers.enable()
else
	DLC1VQ06VampireAttackers.enable()
endif
pDLC1VQ07MapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Quest Complete - Vision has been completed
pDLC1VQ04Portcullis.Activate(Alias_DLC1VQ06RNPCAlias.GetActorRef())
CompleteAllObjectives()
pDLC1VQ07.SetStage(10)
MM.Unlock()
MM.EngageFollowBehavior()
MM.IsWillingToWait = true
MM.CanBeDismissed = true
DLC1VQ06RNPC.Stop()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Fifth cluster of moths gathered by walking through them
;Play visual effect for moths - light burst - and start Scene with Serana
pDLC1VQ06LastMothScene.Start()
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Read the Elder Scrolls once inside the light column
;Game is waiting for the Player to literally read all the three Elder Scrolls
MM.DisengageFollowBehavior()

;we're combing 40 and 50 now that we aren't locking your controls until your read it
;SetObjectiveCompleted(40,1)
;SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;jduvall-- this is used to make an attack on the player in the wilderness for the next wilderness encounter and increase the rate at which these occur
DLC1Radiant.SetDLC1WENextSpecialAttackDay(ForceNextWildernessEncounter = true)

;Player is searching for the Glade after finding the Elder Scrolls
SetObjectiveDisplayed(10,1)
pDLC01DrawKnifeRef.Enable()

;Get rid of Ancestor Spriggan at quest start
pDLC1VQ06SprigganToggle.Disable()

MM.EngageFollowBehavior()
MM.IsWillingToWait = true
MM.CanBeDismissed = true
MM.SetHomeMarker(-1, SeranaWaitPoint)

DLC1VQ06RNPC.Start()
alias_DLC1VQ06CanticleTreeAlias01.getReference().enable()
alias_DLC1VQ06CanticleTreeAlias02.getReference().enable()
alias_DLC1VQ06CanticleTreeAlias03.getReference().enable()
alias_DLC1VQ06CanticleTreeAlias04.getReference().enable()
alias_DLC1VQ06CanticleTreeAlias05.getReference().enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Picked up the bark from a Canticle Tree
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
pDLC1VQ06SeranaBarkComment.Start()
alias_DLC1VQ06CanticleTreeAlias01.getReference().disable()
alias_DLC1VQ06CanticleTreeAlias02.getReference().disable()
alias_DLC1VQ06CanticleTreeAlias03.getReference().disable()
alias_DLC1VQ06CanticleTreeAlias04.getReference().disable()
alias_DLC1VQ06CanticleTreeAlias05.getReference().disable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDLC1VQ07  Auto  

ObjectReference Property pDLC1VQ06PlayerStartMarker  Auto  

Message Property pDLC1VQ06TempMessage  Auto  

VisualEffect Property pDLC1ReadElderScrollBlankEffect  Auto  

ObjectReference Property pDLC1VQ06RNPCStartMarker  Auto  

Scene Property pDLC1VQ06ArrivalScene  Auto  

Scene Property pDLC1VQ06LastMothScene  Auto  

VisualEffect Property pDLC1ReadElderScrollEffect   Auto  

DLC1VQ06QuestScript Property pDLC1VQ06QS  Auto  

ObjectReference Property pDLC01DrawKnifeRef  Auto  

Quest Property DLC1VQ06RNPC  Auto  

DLC1_NPCMentalModelScript Property MM Auto

Book Property pDLC1ElderScrollBlood  Auto  

Book Property pDLC1ElderScrollDragon  Auto  

Book Property pDLC1ElderScrollSun  Auto  

VisualEffect Property pDLC1MothAttachFX01Effect  Auto  

Scene Property pDLC1VQ06SeranaKnifeComment  Auto  

Scene Property pDLC1VQ06SeranaBarkComment  Auto  

Scene Property pDLC1VQ06SeranaMothComment  Auto  

ObjectReference Property pDLC1VQ06SprigganToggle  Auto  

DLC1VQ06ReadingTriggerScript Property DLC1VQ06ReadTriggerRef Auto  

dlc1radiantscript Property DLC1Radiant  Auto  

GlobalVariable Property DLC1PlayingVampireLine  Auto  

ObjectReference Property DLC1VQ06VampireAttackers  Auto  

ObjectReference Property DLC1VQ06DawnguardAttackers  Auto  


Faction Property DLC1VampireFaction  Auto  

Faction Property DLC1HunterFaction  Auto  

ObjectReference Property pDLC1VQ04Portcullis  Auto  

ObjectReference Property SeranaWaitPoint  Auto  

ObjectReference Property pDLC1VQ07MapMarker  Auto  
