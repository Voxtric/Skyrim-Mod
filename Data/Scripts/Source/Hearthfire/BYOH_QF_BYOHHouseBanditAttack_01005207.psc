;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname BYOH_QF_BYOHHouseBanditAttack_01005207 Extends Quest Hidden

;BEGIN ALIAS PROPERTY HouseEdgeMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseEdgeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditDungeonMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditDungeonMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseInteriorLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HouseInteriorLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseSteward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseSteward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InteriorCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InteriorCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY houseLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_houseLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditDungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BanditDungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardPale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardPale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardHjaalmarch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardHjaalmarch Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; bandit 1 dead
if GetStageDone(10) && GetStageDone(30)
	setstage(100)	; end quest
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; shutdown stage - do any cleanup here
alias_Bandit1.GetReference().DeleteWhenAble()
alias_Bandit2.GetReference().DeleteWhenAble()
alias_BanditBoss.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; bandit 2 is dead
if GetStageDone(10) && GetStageDone(20)
	setstage(100)	; end quest
endif
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

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE BYOHHouseWEScript
Quest __temp = self as Quest
BYOHHouseWEScript kmyQuest = __temp as BYOHHouseWEScript
;END AUTOCAST
;BEGIN CODE
; bandit chief dead
if GetStageDone(30) && GetStageDone(20)
	setstage(100)	; end quest
else
	; lower confidence of other bandits
	Alias_Bandit1.GetActorRef().SetActorValue("Confidence", 1)
	Alias_Bandit2.GetActorRef().SetActorValue("Confidence", 1)
	; stop quest when all aliases unload
	kmyquest.StopQuestWhenAliasesUnload = true
	; disable both other bandits on unload
	(Alias_Bandit1 as WEAliasScript).DisableOnUnload = true
	(Alias_Bandit2 as WEAliasScript).DisableOnUnload = true
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
debug.trace(self + " STARTING")
BYOHLastAttack.SetValue(GameDaysPassed.GetValue())
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

GlobalVariable Property BYOHLastAttack  Auto  

GlobalVariable Property GameDaysPassed  Auto  
