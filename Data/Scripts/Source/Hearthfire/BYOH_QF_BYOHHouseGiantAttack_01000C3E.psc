;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname BYOH_QF_BYOHHouseGiantAttack_01000C3E Extends Quest Hidden

;BEGIN ALIAS PROPERTY HouseEdgeMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseEdgeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY houseLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_houseLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseSteward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseSteward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardHjaalmarch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardHjaalmarch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardPale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardPale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY giant
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_giant Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseInteriorLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HouseInteriorLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseCow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseCow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InteriorCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InteriorCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE BYOHHouseWEScript
Quest __temp = self as Quest
BYOHHouseWEScript kmyQuest = __temp as BYOHHouseWEScript
;END AUTOCAST
;BEGIN CODE
; cow or giant is dead
; stop quest when all aliases unload
kmyquest.StopQuestWhenAliasesUnload = true
; disable on unload
(Alias_Giant as WEAliasScript).DisableOnUnload = true
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

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; shutdown stage - do any cleanup here
Alias_Giant.GetRef().DeleteWhenAble()
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
