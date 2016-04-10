;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname BYOH_QF_BYOHHouseStewardOffer_0100308B Extends Quest Hidden

;BEGIN ALIAS PROPERTY FollowerAtHouse1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerAtHouse1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Follower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Follower Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LocationCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY houseLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_houseLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerAtHouse2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerAtHouse2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerAtHouse3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerAtHouse3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; if Follower alias isn't filled, shut down
;debug.trace(self + " stage 10")
;debug.trace(self + "aliases:")
;debug.trace(self + "follower=" + alias_Follower.GetRef())
;debug.trace(self + "followerathouse1=" + alias_FollowerAtHouse1.GetRef())
;debug.trace(self + "followerathouse2=" + alias_FollowerAtHouse2.GetRef())
;debug.trace(self + "houseLocation=" + alias_houselocation.GetLocation())

if Alias_Follower.GetRef() == None
; 	debug.trace(self + " stage 10 - follower alias is empty")
	Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;debug.trace(self + " stage 200")
; add follower to "no forcegreet" faction so they don't offer again
Alias_Follower.GetActorRef().AddToFaction(BYOHHouseStewardNoForcegreet)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;debug.trace(self + " stage 100")
; make follower steward
if Alias_HouseLocation.GetLocation() == BYOHHouse1Location
	BYOHHouseBuilding.HireSteward(0, Alias_Follower.GetActorRef())
elseif Alias_HouseLocation.GetLocation() == BYOHHouse2Location
	BYOHHouseBuilding.HireSteward(1, Alias_Follower.GetActorRef())
elseif Alias_HouseLocation.GetLocation() == BYOHHouse3Location
	BYOHHouseBuilding.HireSteward(2, Alias_Follower.GetActorRef())
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

BYOHHouseBuildingScript Property BYOHHouseBuilding  Auto  

Location Property BYOHHouse1Location  Auto  
{location for house 1}
Location Property BYOHHouse2Location  Auto  
{location for house 2}
Location Property BYOHHouse3Location  Auto  
{location for house 3}


Faction Property BYOHHouseStewardNoForcegreet  Auto  

