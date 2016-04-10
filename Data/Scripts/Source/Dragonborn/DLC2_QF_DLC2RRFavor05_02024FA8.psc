;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC2_QF_DLC2RRFavor05_02024FA8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RRF05FethisAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF05FethisAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has accepted the quest from Fethis
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest starts at game startup
;Note that this quest never closes (the necklaces can respawn, they are in level lists)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Amulet Sell Stage - Repeatable
pDLC2RRFavor05QS.SellPendant()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC2RRFavor05QuestScript Property pDLC2RRFavor05QS Auto
