;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC1_QF_DLC1RH05_01006BAC Extends Quest Hidden

;BEGIN ALIAS PROPERTY BanditLetter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditLetter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BoltFire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BoltFire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossContainer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditScrap3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditScrap3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditScrap5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditScrap5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditScrap1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditScrap1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BoltShock
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BoltShock Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DwarvenCrossbow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DwarvenCrossbow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BoltIce
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BoltIce Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnhancedDwarvenCrossbow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EnhancedDwarvenCrossbow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EnhancedCrossbow
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EnhancedCrossbow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditScrap2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditScrap2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BanditScrap4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BanditScrap4 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DLC1Radiant.QuestAccepted(self)
Alias_MapMarker.GetReference().AddToMap()

SetObjectiveDisplayed(10)

;increase the run count which determines which item is used
DLC1RH05RunCount.SetValue(DLC1RH05RunCount.GetValue() +1 )

;turn off the misc objective in the DLC1Radiant quest to speak to Sorine
DLC1Radiant.SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
CompleteAllObjectives()

; NEED TO MOVE ITEM OUT OF CONTAINER SO THE SCRIPT ATTACHED TO OBJECT REFERENCE IS ATTACHED
;- it's not attached while its in an inventor, needs to be in world
Alias_Item.TryToMoveTo(Alias_BossContainer.GetReference())
DLC1Radiant.EnableDwarvenTech(Alias_Item.GetReference() as DLC1RH05DwarvenTechScript)

if DLC1RH05RunCount.GetValue() == 6
   DLC1RH05FinishedAllQuests.setValue(1)
endif

DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 0)
DLC1Radiant.StopQuestAndStartNewOneHunterTech(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1RadiantScript Property DLC1Radiant  Auto  

GlobalVariable Property DLC1RH05RunCount  Auto  

GlobalVariable Property DLC1RH05FinishedAllQuests  Auto  
