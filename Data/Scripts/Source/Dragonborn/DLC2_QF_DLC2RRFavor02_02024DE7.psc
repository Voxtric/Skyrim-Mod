;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC2_QF_DLC2RRFavor02_02024DE7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RRF02PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF02PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRF02MiloreAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRF02MiloreAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Done
SetObjectiveCompleted(20,1)
Game.GetPlayer().RemoveItem(pDLC2NetchJelly,5)
Game.GetPlayer().AddItem(pRestoreAll06,2)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player accepted the quest
pDLC2RRF02QS.JellyCount()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest is available on game start
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Quest Failed
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Ingredient Property pDLC2NetchJelly Auto
DLC2RRFavor02QuestScript Property pDLC2RRF02QS Auto
Potion Property pRestoreAll06  Auto 
