;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC2_QF_DLC2SkaalVillageFreef_0310D651 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Runil
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Runil Auto
;END ALIAS PROPERTY

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

;BEGIN ALIAS PROPERTY Necklace
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Necklace Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(20)
Game.GetPlayer().AddItem(DLC2ArmorNordicHeavyHelmet, 1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
Game.GetPlayer().RemoveItem(DLC2SVFreeform1Necklace, 1)
Alias_Runil.GetActorRef().AddItem(DLC2SVFreeform1Necklace, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)
Alias_Morwen.GetActorRef().RemoveItem(DLC2SVFreeform1Necklace, 1)
Game.GetPlayer().AddItem(DLC2SVFreeform1Necklace, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property DLC2SVFreeform1Necklace  Auto  

Armor Property DLC2ArmorNordicHeavyHelmet  Auto  
