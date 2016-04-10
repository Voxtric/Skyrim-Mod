;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname DLC2_QF_DLC2TTF2_0201AAC8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY xMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HarstradMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HarstradMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Harstrad
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Harstrad Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlantTaproot
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlantTaproot Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoakedTaproot3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SoakedTaproot3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoakedTaproot2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SoakedTaproot2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Elynea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Elynea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SprigganBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SprigganBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spriggan01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spriggan01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY XMarkerBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_XMarkerBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spriggan02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spriggan02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SoakedTaproot1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SoakedTaproot1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WATER
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WATER Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY xMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_xMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WitheredWall
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WitheredWall Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Player is told of Elynea's need

Alias_HarstradMapMarker.GetRef().AddToMap()

alias_water.GetRef().Enable()

int TaprootCount = game.GetPlayer().GetItemCount(Taproot)
if TaprootCount >= 3
	DLC2TaprootsAcquired.SetValue(3)
	UpdateCurrentInstanceGlobal(DLC2TaprootsAcquired)
                SetObjectiveDisplayed(100, true)
	SetObjectiveCompleted(100, true)
	SetObjectiveDisplayed(110, true)
else
	DLC2TaprootsAcquired.SetValue(TaprootCount)
	UpdateCurrentInstanceGlobal(DLC2TaprootsAcquired)
                SetObjectiveDisplayed(100, true)
endIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; player returns to Elynea and quest completes

SetObjectiveCompleted(400, true)
DLC2TTF2PotionsAvailable.setvalue(0)
Game.GetPlayer().AddItem(DLC2LItemPotionsRestoreAllBest, 2)
alias_Elynea.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
alias_WitheredWall.GetRef().Disable()

AchievementsQuest.IncSideQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; Player plants the taproot

SetObjectiveCompleted(300, true)
SetObjectiveDisplayed(400, true)

DLC2PlantTaprootRef.Disable()
game.GetPlayer().RemoveItem(DLC2TaprootSoaked, 99)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Player gives taproots to Elynea

SetObjectiveCompleted(200, true)
SetObjectiveDisplayed(300, true)

DLC2PlantTaprootRef.Enable()
game.GetPlayer().RemoveItem(DLC2TaprootSoaked, 2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player has soaked three taproots in the river

SetObjectiveCompleted(100, true)
SetObjectiveCompleted(110, true)
SetObjectiveDisplayed(200, true)

alias_water.GetRef().Disable()
game.GetPlayer().RemoveItem(Taproot, 3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
if IsObjectiveDisplayed(100) == true && IsObjectiveCompleted(100) == false
    SetObjectiveFailed(100)
endif
if IsObjectiveDisplayed(110) == true && IsObjectiveCompleted(110) == false
    SetObjectiveFailed(110)
endif
if IsObjectiveDisplayed(200) == true && IsObjectiveCompleted(200) == false
    SetObjectiveFailed(200)
endif
if IsObjectiveDisplayed(300) == true && IsObjectiveCompleted(300) == false
    SetObjectiveFailed(300)
endif

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC2PlantTaprootRef  Auto  

GlobalVariable Property DLC2TTF2PotionsAvailable  Auto  

LeveledItem Property DLC2LItemPotionsRestoreAllBest  Auto  

Ingredient Property Taproot  Auto  

GlobalVariable Property DLC2TaprootsAcquired  Auto  

MiscObject Property DLC2TaprootSoaked  Auto  

AchievementsScript Property AchievementsQuest Auto
