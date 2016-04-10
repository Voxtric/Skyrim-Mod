;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname DLC2_QF_DLC2RRFavor04_02024E04 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RRF03GeldisAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF03GeldisAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest is available at game start
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Gave a drink!
pDLC2RRF04QS.GiveADrink()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player has given out the requested ten samples
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has accepted the quest
SetObjectiveDisplayed(10,1)
Game.GetPlayer().AddItem(pDLC2RRF04Sujamma,10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Quest is finished
SetObjectiveCompleted(20,1)
Game.GetPlayer().AddItem(pDLC2RRFavorGoldAward)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property pDLC2RRTempleTombKey  Auto  

LeveledItem Property pDLC2RRFavorGoldAward  Auto  

DLC2FFR04QuestScript Property pDLC2RRF04QS  Auto  

Potion Property pDLC2RRF04Sujamma  Auto  
