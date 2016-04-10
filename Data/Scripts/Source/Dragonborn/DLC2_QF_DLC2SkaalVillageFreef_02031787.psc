;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname DLC2_QF_DLC2SkaalVillageFreef_02031787 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Edla
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Edla Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nikulas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nikulas Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;The player is sent to talk to Nikulas
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Fail and stop the quest if the player kills either Edla or Nikulas
if GetStageDone(20)
   SetStage(350)
else 
   Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Startup Stage
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Fail and stop the quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(20)
Game.GetPlayer().AddItem(DLC2EmperorParasolMoss, 5)
Game.GetPlayer().AddItem(DLC2Scathecraw, 5)
Game.GetPlayer().AddItem(DLC2SpikyAshPlant, 5)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;The player has convinced Nikulas to stay and must now return to Edla
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Ingredient Property DLC2SpikyAshPlant  Auto  

Ingredient Property DLC2Scathecraw  Auto  

Ingredient Property DLC2EmperorParasolMoss  Auto  
