;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname DLC2_QF_DLC2TT1_02017E8D Extends Quest Hidden

;BEGIN ALIAS PROPERTY Drovas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Drovas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AshSpawn2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshSpawn2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VaronaDeadMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VaronaDeadMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Varona
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Varona Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AshSpawn3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshSpawn3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AshSpawn1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshSpawn1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnchanterDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EnchanterDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Talvas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Talvas Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; Neloth asks player to find Varona

SetObjectiveDisplayed(150, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; Drovas accepts the position

SetObjectiveCompleted(300, true)
SetObjectiveDisplayed(400, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; player finds Varona's body before the Neloth asks him to find her

SetObjectiveDisplayed(200, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Player is pointed to Varona's body
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Player gets pointed to Drovas
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; Player tells Neloth that Varona is dead
; Neloth asks the player get find him a new steward

SetObjectiveCompleted(200, true)
SetObjectiveDisplayed(300, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Player has activated Varona's dead body after being asked to find her

SetObjectiveDisplayed(200, true)
SetObjectiveCompleted(150, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Player collects reward from Neloth and quest completes

SetObjectiveCompleted(400, true)

Game.GetPlayer().AddItem(Gold, 500,false)
Game.GetPlayer().AddITem(DLC2TelMithrynStaffEnchanterKey, 1)

Game.GetPlayer().AddToFaction(DLC2StaffMakerFaction)
Alias_Neloth.GetActorRef().AddToFaction(DLC2StaffMakerFaction)
Alias_Talvas.GetActorRef().AddToFaction(DLC2StaffMakerFaction)

Alias_Drovas.GetRef().AddItem(DLC2TelMithrynStewardKey, 1)

alias_Neloth.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
alias_Drovas.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)

DLC2StaffEnchanterNavmeshControl.Disable()
Alias_EnchanterDoor.GetRef().Lock(false)

AchievementsQuest.IncSideQuests()
DLC2TT1b.Start()
DLC2TTR5.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; start up stage

DLC2Init.SetStage(100)
DLC2MQ01.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Set when player talks to Varona
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Set when player leaves the Raven Rock location...
; but only after he's talked to Varona at least once.

Alias_Varona.GetActorRef().GetActorBase().SetEssential(false)
Alias_Varona.GetActorRef().Kill(none)
utility.wait(1)
Alias_Varona.GetRef().MoveTo(Alias_VaronaDeadMarker.GetRef())

Alias_AshSpawn1.GetRef().Enable()
Alias_AshSpawn2.GetRef().Enable()
Alias_AshSpawn3.GetRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Gold  Auto  

Quest Property DLC2TT1b  Auto  

Quest Property DLC2Init  Auto  

Faction Property DLC2StaffMakerFaction  Auto  

Key Property DLC2TelMithrynStewardKey  Auto  

Quest Property DLC2TTR5  Auto  

Quest Property DLC2MQ01  Auto  

AchievementsScript Property AchievementsQuest Auto

Key Property DLC2TelMithrynStaffEnchanterKey  Auto  

ObjectReference Property DLC2StaffEnchanterNavmeshControl  Auto  
 
