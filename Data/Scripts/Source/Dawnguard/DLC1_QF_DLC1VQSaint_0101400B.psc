;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC1_QF_DLC1VQSaint_0101400B Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC1VQSaintJiubAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQSaintJiubAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQSaintPage06Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQSaintPage06Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQSaintPage02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQSaintPage02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQSaintPage05Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQSaintPage05Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQSaintPage03Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQSaintPage03Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQSaintPage07Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQSaintPage07Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQSaintPage10Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQSaintPage10Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQSaintPage04Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQSaintPage04Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQSaintPage08Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQSaintPage08Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQSaintPage09Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQSaintPage09Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQSaintPage01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQSaintPage01Alias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Scene Triggered
pDLC1VQSaintPacingScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Debug Fast Start
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Quest completed - Start Jiub's post quest state
SetObjectiveCompleted(20,1)
Game.GetPlayer().RemoveItem(Alias_DLC1VQSaintPage01Alias.GetRef())
Game.GetPlayer().RemoveItem(Alias_DLC1VQSaintPage02Alias.GetRef())
Game.GetPlayer().RemoveItem(Alias_DLC1VQSaintPage03Alias.GetRef())
Game.GetPlayer().RemoveItem(Alias_DLC1VQSaintPage04Alias.GetRef())
Game.GetPlayer().RemoveItem(Alias_DLC1VQSaintPage05Alias.GetRef())
Game.GetPlayer().RemoveItem(Alias_DLC1VQSaintPage06Alias.GetRef())
Game.GetPlayer().RemoveItem(Alias_DLC1VQSaintPage07Alias.GetRef())
Game.GetPlayer().RemoveItem(Alias_DLC1VQSaintPage08Alias.GetRef())
Game.GetPlayer().RemoveItem(Alias_DLC1VQSaintPage09Alias.GetRef())
Game.GetPlayer().RemoveItem(Alias_DLC1VQSaintPage10Alias.GetRef())
Game.GetPlayer().AddItem(pDLC1VQSaintFinalBook,1)
Game.GetPlayer().AddItem(pDLC1JiubNecklace,1)
pDLC1VQSaintPost.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;All of the pages have been located - point back to Jiub
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Jiub has assigned the pages quest to the player
if pDLC1VQSaintCount.GetValue() < 10
UpdateCurrentInstanceGlobal(pDLC1VQSaintCount)
SetObjectiveDisplayed(10,1)
elseif  pDLC1VQSaintCount.GetValue() >= 10
SetStage(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pDLC1VQSaintPacingScene  Auto  

Quest Property pDLC1VQSaintPost  Auto  

Armor Property pDLC1JiubNecklace  Auto  

Book Property pDLC1VQSaintFinalBook  Auto  

GlobalVariable Property pDLC1VQSaintCount  Auto  
