;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 20
Scriptname BYOH_QF_BYOHHouseSkeeverInfes_01010A44 Extends Quest Hidden

;BEGIN ALIAS PROPERTY houseLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_houseLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeever2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skeever2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InteriorCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InteriorCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Child1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Child1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseInteriorLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HouseInteriorLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkeeverTame
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkeeverTame Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeever1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skeever1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeever3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skeever3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Skeever4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Skeever4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardPale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardPale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseEdgeMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseEdgeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BasementMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BasementMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseSteward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseSteward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardHjaalmarch
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardHjaalmarch Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StewardFalkreath
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StewardFalkreath Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Child2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Child2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
debug.trace(self + " STARTING")
; random chance of 2 or 3 being disabled
int dieroll = utility.RandomInt(1, 100)
if dieRoll >= 50
	Alias_Skeever2.GetRef().Disable()
	Alias_Skeever2.GetRef().Delete()
endif

if dieRoll >= 75
	Alias_Skeever3.GetRef().Disable()
	Alias_Skeever3.GetRef().Delete()
endif

if Alias_HouseLocation.GetLocation() == BYOHHouse1Location
	(Alias_SkeeverTame.GetActorRef() as BYOHHouseSkeeverTameScript).myhouse = BYOHHouseFalkreath
	BYOHHouseFalkreath.bHaveSkeever = true
elseif Alias_HouseLocation.GetLocation() == BYOHHouse2Location
	(Alias_SkeeverTame.GetActorRef() as BYOHHouseSkeeverTameScript).myhouse = BYOHHouseHjaalmarch
	BYOHHouseHjaalmarch.bHaveSkeever = true
elseif Alias_HouseLocation.GetLocation() == BYOHHouse3Location
	(Alias_SkeeverTame.GetActorRef() as BYOHHouseSkeeverTameScript).myhouse = BYOHHousePale
	BYOHHousePale.bHaveSkeever = true
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; shutdown stage - do any cleanup here
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
; player has killed one of the skeevers - shut down quest
setstage(100)
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BYOHHouseScript Property BYOHHouseFalkreath Auto  
;BYOHHouseScript Property BYOHHouseFalkreath Auto  
;BYOHHouseScript Property BYOHHouseFalkreath Auto  


Location Property BYOHHouse1Location  Auto  
{location for house 1}

Location Property BYOHHouse2Location  Auto  

Location Property BYOHHouse3Location  Auto  


Faction Property BYOHHouseStewardNoForcegreet  Auto  

BYOHhousescript Property BYOHHouseHjaalmarch  Auto  
BYOHhousescript Property BYOHHousePale  Auto  

