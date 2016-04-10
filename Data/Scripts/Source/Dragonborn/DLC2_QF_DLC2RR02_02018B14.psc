;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname DLC2_QF_DLC2RR02_02018B14 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RR02TombQTAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02TombQTAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02VendilAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02VendilAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02SeverinHouseMarkerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02SeverinHouseMarkerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02VelethAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02VelethAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02GeldisAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02GeldisAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02TilisuAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02TilisuAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02MorvaynAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02MorvaynAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02MirriAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02MirriAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02AdrilAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02AdrilAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02GuardQT
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02GuardQT Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRHoldingSafeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRHoldingSafeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02EvidenceAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02EvidenceAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02SafeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02SafeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR02PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR02PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Quest is in holding pattern, Player isn't taking it right now
if isObjectiveDisplayed(5) == 0
SetObjectiveDisplayed(5,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Go Speak to Geldis at the Cornerclub
if IsObjectiveDisplayed(5) == 1
SetObjectiveCompleted(5,1)
endif
SetObjectiveDisplayed(10,1)
Alias_DLC2RR02VendilAlias.GetActorRef().Disable()
Alias_DLC2RR02VendilAlias.GetActorRef().MoveTo(pDLC2RR02EndMarker)
pDLC2RRVendilSeverin.SetEssential(false)
Alias_DLC2RR02VendilAlias.GetActorRef().RemoveFromFaction(pDLC2CrimeRavenRockFaction)
Alias_DLC2RR02VendilAlias.GetActorRef().RemoveFromFaction(pDLC2RRSeverinSpouseFaction)
Alias_DLC2RR02VendilAlias.GetActorRef().RemoveFromFaction(pDLC2RRSeverinManorFaction)
Alias_DLC2RR02VendilAlias.GetActorRef().AddToFaction(pDLC2MoragTongFaction)
Alias_DLC2RR02VendilAlias.GetActorRef().SetAv("Aggression",1)
Alias_DLC2RR02VendilAlias.GetActorRef().SetOutfit(pDLC2VendilSeverinBattleOutfit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Kickoff Scene!
SetObjectiveCompleted(80,1)
SetObjectiveDisplayed(90,1)
pDLC2RR02Scene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Debug Quest StartUp
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;This stage fires when the other two quests in Raven Rock have been completed
;Tracked in DLC2RR00
;Sets the guard/Veleth/Morvayn dialogue to true - Veleth seeks Player
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Done with Adril... go search the house - make public cell
Alias_DLC2RR02TilisuAlias.GetActorRef().MoveTo(pDLC2RR02TilisuEnableMarker)
Alias_DLC2RR02MirriAlias.GetActorRef().MoveTo(pDLC2RR02MirriEnableMarker)
Alias_DLC2RR02MirriAlias.GetActorRef().RemoveFromFaction(pDLC2CrimeRavenRockFaction)
Alias_DLC2RR02MirriAlias.GetActorRef().RemoveFromFaction(pDLC2RRSeverinSpouseFaction)
Alias_DLC2RR02MirriAlias.GetActorRef().RemoveFromFaction(pDLC2RRSeverinManorFaction)
Alias_DLC2RR02TilisuAlias.GetActorRef().RemoveFromFaction(pDLC2CrimeRavenRockFaction)
Alias_DLC2RR02TilisuAlias.GetActorRef().RemoveFromFaction(pDLC2RRSeverinSpouseFaction)
Alias_DLC2RR02TilisuAlias.GetActorRef().RemoveFromFaction(pDLC2RRSeverinManorFaction)
Alias_DLC2RR02TilisuAlias.GetActorRef().AddToFaction(pDLC2MoragTongFaction)
Alias_DLC2RR02MirriAlias.GetActorRef().AddToFaction(pDLC2MoragTongFaction)
pDLC2RRMirriSeverin.SetEssential(false)
pDLC2RRTilisuSeverin.SetEssential(false)
Alias_DLC2RR02TilisuAlias.GetActorRef().SetAv("Aggression",1)
Alias_DLC2RR02MirriAlias.GetActorRef().SetAv("Aggression",1)
Alias_DLC2RR02TilisuAlias.GetActorRef().EvaluatePackage()
Alias_DLC2RR02MirriAlias.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddItem(pDLC2RRSeverinManorKey,1)
Alias_DLC2RR02SafeAlias.GetRef().AddItem(Alias_DLC2RR02EvidenceAlias.GetRef())
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Adril has sent the Player to final location
;Enable the dead Redoran Guard
pDLC2AshfallowMapMarker.AddToMap()
pDLC2RR02DoorEnableMarker.Disable()
pDLC2RR02GuardsEnabler.Enable()
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(65,1)
pDLC2RR02QS.SeverinMove()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Done at the tomb... speak to Adril
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
UnregisterForUpdate()
pDLC2SeverinHouseDoorRef.Lock()
pDLC2SeverinHouseDoorRef.SetLockLevel(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Stake out the tomb
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;All Severins (Ulen) are dead - speak to Adril
SetObjectiveCompleted(70,1)
SetObjectiveDisplayed(80,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Scene Over... talk to Morvayn
SetObjectiveCompleted(90,1)
SetObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Trigger near dead Redoran Guard hit
SetObjectiveCompleted(65,1)
SetObjectiveDisplayed(70,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player is in Tomb at proper time - trigger Tilisu move
pDLC2RR02QS.TilisuCountdown()
RegisterForSingleUpdate(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Got the evidence
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
Alias_DLC2RR02VendilAlias.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Quest Completed
AchievementsQuest.IncSideQuests()
SetObjectiveCompleted(100,1)
Game.GetPlayer().AddItem(pDLC2RR02GoldAward)
pDLC2RR02GuardsEnabler.Disable()
pDLC2SeverinPlayerHouseEnableMarker.Enable()
pDLC2RRSeverinHouse.SetActorOwner(Game.GetPlayer().GetActorBase())
game.IncrementStat( "Houses Owned" )
Game.AddAchievement(74)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Veleth has pointed to Adril
SetObjectiveDisplayed(5,1)
Alias_DLC2RR02VelethAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pDLC2RR02TombMoveMarker  Auto  

ObjectReference Property pDLC2RR02TilisuEnableMarker  Auto  

ObjectReference Property pDLC2RR02MirriEnableMarker  Auto  

ActorBase Property pDLC2RRMirriSeverin  Auto  

ActorBase Property pDLC2RRTilisuSeverin  Auto  

ActorBase Property pDLC2RRVendilSeverin  Auto  

DLC2RR00QuestScript Property pDLC2RR00QS  Auto  

LeveledItem Property pDLC2RR02GoldAward  Auto  

ObjectReference Property pDLC2RR02EndMarker  Auto  

ObjectReference Property pDLC2RR02DoorEnableMarker  Auto  

ObjectReference Property pDLC2RR02MirriEndMarker  Auto  

ObjectReference Property pDLC2RR02TilisuEndMarker  Auto  

DLC2RR02QuestScript Property pDLC2RR02QS  Auto  

Faction Property pDLC2CrimeRavenRockFaction  Auto  

Faction Property pDLC2MoragTongFaction  Auto  

Scene Property pDLC2RR02Scene  Auto  

ObjectReference Property pDLC2AshfallowMapMarker  Auto  

ObjectReference Property pDLC2RR02DeadGuard01Ref  Auto  

ObjectReference Property pDLC2RR02DeadGuard02Ref  Auto  

Outfit Property pDLC2MoragTongOutfit  Auto  

Key Property pDLC2RRSeverinManorKey  Auto  

ObjectReference Property pDLC2SeverinHouseDoorRef  Auto  

ObjectReference Property pDLC2RR02GuardsEnabler  Auto  

Outfit Property pDLC2VendilSeverinBattleOutfit  Auto  

AchievementsScript Property AchievementsQuest  Auto  

Faction Property pDLC2RRSeverinManorFaction  Auto  

Faction Property pDLC2RRSeverinSpouseFaction  Auto  

ObjectReference Property pDLC2SeverinPlayerHouseEnableMarker  Auto  

Cell Property pDLC2RRSeverinHouse  Auto  

Faction Property pPlayerFaction  Auto  
