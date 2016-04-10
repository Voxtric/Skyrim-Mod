;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC2_QF_DLC2TGQuest_0202AD26 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2TGEsmondAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2TGEsmondAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2TGPlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2TGPlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRFormulaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRFormulaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2TGGloverAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2TGGloverAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Dialogue break so Glover doesn't rattle through initial intro if Player bails out
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player has given formula to Glover
SetObjectiveCompleted(20,1)
Game.GetPlayer().AddItem(pDLC2TGGloverKey,1)
Game.GetPlayer().AddItem(pDLC2RRGloverHouseKey,1)
Game.GetPlayer().RemoveItem(Alias_DLC2RRFormulaAlias.GetRef())
Alias_DLC2TGGloverAlias.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
pDLC2RRGloverMalloryHouse.SetPublic()
pDLC2ImprovedBonemold.SetValue(1.0)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has initially spoken to Glover
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player has recovered the formula if they spoke to Glover first
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
pDLC2TGGlobal01.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Key Property pDLC2TGGloverKey  Auto  

GlobalVariable Property pDLC2TGGlobal01  Auto  

Key Property pDLC2RRGloverHouseKey  Auto  

Cell Property pDLC2RRGloverMalloryHouse  Auto  

GlobalVariable Property pDLC2ImprovedBonemold  Auto  
