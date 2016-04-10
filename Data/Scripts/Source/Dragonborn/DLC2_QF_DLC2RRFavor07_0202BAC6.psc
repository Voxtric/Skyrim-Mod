;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname DLC2_QF_DLC2RRFavor07_0202BAC6 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RRF07ChestAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF07ChestAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF07PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF07PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF07CindiriAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF07CindiriAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF07BookAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF07BookAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player returned the book to Cindiri
SetObjectiveCompleted(20,1)
Game.GetPlayer().RemoveItem(Alias_DLC2RRF07BookAlias.GetRef())
Game.GetPlayer().AddItem(pLItemEnchJewelryAll,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Cindiri has asked for the book
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest autostarts
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player recovers the book
if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pLItemEnchJewelryAll  Auto  
