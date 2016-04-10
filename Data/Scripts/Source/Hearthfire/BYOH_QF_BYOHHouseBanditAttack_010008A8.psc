;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 37
Scriptname BYOH_QF_BYOHHouseBanditAttack_010008A8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BanditDungeonMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditDungeonMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseInteriorLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HouseInteriorLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditDungeonCaptiveMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditDungeonCaptiveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseFrontDoorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseFrontDoorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InteriorCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InteriorCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY houseLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_houseLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardPale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardPale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseEdgeMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseEdgeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseSteward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseSteward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RansomNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RansomNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditBossNew
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditBossNew Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditDungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BanditDungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditDungeonMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditDungeonMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditDungeonCaptiveFurniture
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditDungeonCaptiveFurniture Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseCarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseCarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardHjaalmarch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardHjaalmarch Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE BYOHHouseWEScript
Quest __temp = self as Quest
BYOHHouseWEScript kmyQuest = __temp as BYOHHouseWEScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
BYOHLastAttack.SetValue(GameDaysPassed.GetValue()) ; timestamp
; if spouse but no housecarl, have your spouse kidnapped and put in the bandit dungeon
if Alias_Housecarl.GetRef() == None && Alias_Spouse.GetRef()
	setstage(10)
else
	; remove ransom note
	Alias_BanditBoss.GetRef().RemoveItem(Alias_RansomNote.GetRef())
	; move boss to house
	Alias_BanditBossNew.GetRef().MoveTo(Alias_houseEdgeMarker.GetRef())
	; stop quest when all aliases unload
	kmyquest.StopQuestWhenAliasesUnload = true
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
; bandits let spouse go (intimidate/persuade success)
Alias_Spouse.GetActorRef().SetRestrained(false)
Alias_Spouse.GetActorRef().EvaluatePackage()
CompleteAllObjectives()
setstage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; at least 1 bandit attacked
setstage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
; player pays ransom
Game.GetPlayer().RemoveItem(Gold001, BYOHHBA2Ransom.GetValueInt())
Alias_Spouse.GetActorRef().SetRestrained(false)
Alias_Spouse.GetActorRef().EvaluatePackage()
CompleteAllObjectives()
setstage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN AUTOCAST TYPE BYOHHouseWEScript
Quest __temp = self as Quest
BYOHHouseWEScript kmyQuest = __temp as BYOHHouseWEScript
;END AUTOCAST
;BEGIN CODE
; quest is ready to shut down when all bandit aliases unload
; stop quest when all aliases unload
kmyquest.StopQuestWhenAliasesUnload = true
; disable both other bandits on unload
(Alias_Bandit1 as WEAliasScript).DisableOnUnload = true
(Alias_Bandit2 as WEAliasScript).DisableOnUnload = true
(Alias_Bandit3 as WEAliasScript).DisableOnUnload = true
(Alias_BanditBossNew as WEAliasScript).DisableOnUnload = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
debug.trace(self + " Stage 10 - kidnap spouse")
	Actor spouse = Alias_Spouse.GetActorRef()
	spouse.AddToFaction(dunPrisonerFaction)
	spouse.Moveto(Alias_BanditDungeonCaptiveMarker.GetRef())
	spouse.SetRestrained(true)
	; move extra bandits to dungeon
	Alias_Bandit2.GetRef().MoveTo(Alias_BanditDungeonMarker.GetRef())
	Alias_Bandit3.GetRef().MoveTo(Alias_BanditDungeonMarker.GetRef())
	; make bandits non-aggressive to player
	Alias_Bandit1.GetActorRef().AddToFaction(BYOHHouseBanditAttackFriendFaction)
	Alias_Bandit2.GetActorRef().AddToFaction(BYOHHouseBanditAttackFriendFaction)
	Alias_Bandit3.GetActorRef().AddToFaction(BYOHHouseBanditAttackFriendFaction)
	Alias_BanditBossNew.GetActorRef().AddToFaction(BYOHHouseBanditAttackFriendFaction)
	Game.GetPlayer().AddToFaction(BYOHHouseBanditAttackFriendFaction)
	; give her ransom note
	Alias_Bandit1.GetRef().AddItem(Alias_RansomNote.GetRef())
	; reset dungeon
	Alias_BanditBoss.GetRef().GetParentCell().Reset()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; shutdown stage - do any cleanup here
alias_Bandit1.GetReference().DeleteWhenAble()
alias_Bandit2.GetReference().DeleteWhenAble()
alias_Bandit3.GetReference().DeleteWhenAble()
alias_BanditBossNew.GetReference().DeleteWhenAble()
; shut down pacifier quest
BYOHHouseBanditPacifier.Stop()
; failsafe
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; player talked to bandit - add note
Game.GetPlayer().AddItem(Alias_RansomNote.GetRef())
Alias_Bandit1.GetActorRef().EvaluatePackage()
SetObjectiveDisplayed(5, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
; player rescues spouse
Alias_Spouse.GetActorRef().SetRestrained(false)
Alias_Spouse.GetActorRef().EvaluatePackage()
Alias_Spouse.GetActorRef().RemoveFromFaction(dunPrisonerFaction)
CompleteAllObjectives()
setstage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
; make all bandits aggressive again
Alias_Bandit1.GetActorRef().RemoveFromFaction(BYOHHouseBanditAttackFriendFaction)
Alias_Bandit2.GetActorRef().RemoveFromFaction(BYOHHouseBanditAttackFriendFaction)
Alias_Bandit3.GetActorRef().RemoveFromFaction(BYOHHouseBanditAttackFriendFaction)
Alias_BanditBossNew.GetActorRef().RemoveFromFaction(BYOHHouseBanditAttackFriendFaction)
Game.GetPlayer().RemoveFromFaction(BYOHHouseBanditAttackFriendFaction)
BYOHHouseBanditPacifier.Stop()
setstage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; player got note or talked to bandit
SetObjectiveCompleted(5, 1)
SetObjectiveDisplayed(10, 1)
Alias_BanditDungeonMapMarker.GetRef().AddToMap()
Alias_Bandit1.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BYOHHouseScript Property BYOHHouseFalkreath Auto  
;BYOHHouseScript Property BYOHHouseFalkreath Auto  
;BYOHHouseScript Property BYOHHouseFalkreath Auto  


Location Property BYOHHouse1Location  Auto  
{location for house 1}

Faction Property BYOHHouseStewardNoForcegreet  Auto  

Faction Property dunPrisonerFaction  Auto  

MiscObject Property Gold001  Auto  

GlobalVariable Property BYOHHBA2Ransom  Auto  

Quest Property BYOHHouseBanditPacifier  Auto  

FavorDialogueScript Property DialogueFavorGeneric  Auto  

Faction Property BYOHHouseBanditAttackFriendFaction  Auto  

GlobalVariable Property BYOHLastAttack  Auto  

GlobalVariable Property GameDaysPassed  Auto  
