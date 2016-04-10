;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC2_QF_DLC2SkaalVillageFreef_0202C8AA Extends Quest Hidden

;BEGIN ALIAS PROPERTY GoToSolstheim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GoToSolstheim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GoToSkyrim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GoToSkyrim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Morwen
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Morwen Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Runil
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Runil Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Necklace
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necklace Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Fail and stop the quest if the player kills either Morwen or Runil
if GetStageDone(10)
   SetStage(350)
else 
   Stop()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Morwen gives the player Bera's Necklace to take to Runil

SetObjectiveDisplayed(10)
Game.GetPlayer().AddItem(Alias_Necklace.GetReference(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;The player gives Bera's Necklace to Runil

SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
Alias_Runil.GetActorRef().AddItem(Alias_Necklace.GetReference(), 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(20)
Game.GetPlayer().AddItem(DLC2ArmorNordicHeavyHelmet, 1)
Game.GetPlayer().SetRelationshipRank(Alias_Morwen.GetActorRef(), 3)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Fail and stop the quest
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property DLC2SVFreeform1Necklace  Auto  

Armor Property DLC2ArmorNordicHeavyHelmet  Auto  
