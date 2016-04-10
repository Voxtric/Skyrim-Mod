;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 29
Scriptname BYOH_QF_BYOHHousePale_01010BEE Extends Quest Hidden

;BEGIN ALIAS PROPERTY IntroNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IntroNote Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Steward
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Steward Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY houseLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_houseLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseHorse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseHorse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseInteriorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseInteriorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CarpentersWorkbench
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CarpentersWorkbench Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Hold
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Hold Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseCarriageDriver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseCarriageDriver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Charter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Charter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DraftingTable
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DraftingTable Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_HoldCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CourierNote
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CourierNote Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
; complete drafting table objective
SetObjectiveCompleted(110)
; give workbench objective
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE byohhousescript
Quest __temp = self as Quest
byohhousescript kmyQuest = __temp as byohhousescript
;END AUTOCAST
;BEGIN CODE
; player visits house
SetObjectiveCompleted(100)
; give lumber mill objective
kmyQuest.BYOHHouseBuilding.SetStage(120)
; give drafting table objective
SetObjectiveDisplayed(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; start alias updating to watch for swaps
Alias_Jarl.RegisterForUpdate(10)
Alias_Steward.RegisterForUpdate(9.5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; player reads courier note
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE byohhousescript
Quest __temp = self as Quest
byohhousescript kmyQuest = __temp as byohhousescript
;END AUTOCAST
;BEGIN CODE
; finish room 6
; if room 3 or 9 finished, enable bridge(s)
kmyQuest.FinishPorchRoom()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
SetObjectiveDisplayed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; talk to steward about buying land
SetObjectiveCompleted(30)
; stop courier if he's on his way
if Alias_CourierNote.GetRef()
	WICourier.removeRefFromContainer(Alias_CourierNote.GetRef())
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
; complete workbench objective
SetObjectiveCompleted(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; finish room 2
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE byohhousescript
Quest __temp = self as Quest
byohhousescript kmyQuest = __temp as byohhousescript
;END AUTOCAST
;BEGIN CODE
; finish room 9
; if room 6 finished, enable bridge
kmyQuest.FinishPorchRoom()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; finish room 1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN AUTOCAST TYPE byohhousescript
Quest __temp = self as Quest
byohhousescript kmyQuest = __temp as byohhousescript
;END AUTOCAST
;BEGIN CODE
; finish room 3
; if room 6 finished, enable bridge
kmyQuest.FinishPorchRoom()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE byohhousescript
Quest __temp = self as Quest
byohhousescript kmyQuest = __temp as byohhousescript
;END AUTOCAST
;BEGIN CODE
; buy land
kmyQuest.BuyProperty()
SetObjectiveDisplayed(100)
; update gamedayspassed value on quest
UpdateCurrentInstanceGlobal(GameDaysPassed)
; create deed
ObjectReference newCharter = Alias_Steward.GetRef().PlaceAtMe(Charter)
; put in alias
Alias_Charter.ForceRefTo(newCharter)
; give to player
Game.GetPlayer().AddItem(newCharter)
; achievement
Game.AddAchievement(62) ; landowner
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; send courier - set by BYOHHouseBuildingScript.PlayerChangeLocation
debug.trace(self + "stage 15 - sending intro note")
; create letter
; send intro letter
ObjectReference newLetter = Alias_Steward.GetRef().PlaceAtMe(BYOHHouseJarlIntroLetter)
Alias_IntroNote.ForceRefTo(newLetter)
; send courier
WICourier.addItemToContainer(newLetter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; send courier - set by BYOHHouseBuilding startup stage
debug.trace(self + "stage 20 - sending courier")
; create letter
ObjectReference newLetter = Alias_Steward.GetRef().PlaceAtMe(BYOHHouseJarlFriendLetter)
; put in alias
Alias_CourierNote.ForceRefTo(newLetter)
; send courier
WICourier.addItemToContainer(newLetter)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; achievement
Game.AddAchievement(64) ; land baron - own all 3 properties
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WICourierScript Property WICourier  Auto  

Book Property Charter  Auto  
{land title to house}

Book Property BYOHHouseJarlIntroLetter  Auto  

Book Property BYOHHouseJarlFriendLetter  Auto  



GlobalVariable Property GameDaysPassed  Auto  
