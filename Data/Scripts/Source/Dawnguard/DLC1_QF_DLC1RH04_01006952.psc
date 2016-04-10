;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname DLC1_QF_DLC1RH04_01006952 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Habitation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Habitation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarkerDungeon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarkerDungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dwelling
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dwelling Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarkerHabitation
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarkerHabitation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HabitationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HabitationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Friend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HouseContainer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HouseContainer Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
CompleteAllObjectives()
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 0)
DLC1Radiant.StopQuestAndStartNewOneHunter(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;player killed vampire
SetObjectiveCompleted(50)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player gets the letter (in dialogue, or from taking it
Game.GetPlayer().AddItem(Alias_Letter.GetReference())

Alias_Vampire.TryToEnable()
DLC1Radiant.GimpAlias(Alias_Boss); mods health, stamina, and magicka to make it easier

Alias_MapMarkerDungeon.GetReference().AddToMap()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;NOTE ABOUT THIS QUEST
;Because of how we fill the Friend alias last, and we are searching for someone with particular voice type
;it's possible this quest fails to fill that alias, and then the quest gives up trying
;It means it will be less likely to be seen, even in a random do all before repeating node
;and isn't guaranteed to start even if its made to be the debugquest

;STAGE 1 is STARTUP STAGE
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DLC1Radiant.QuestAccepted(self)
Alias_MapMarkerHabitation.GetReference().AddToMap()
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
ObjectReference HouseContainer = Alias_HouseContainer.GetReference()
if HouseContainer
   HouseContainer.AddItem(Alias_Letter.GetReference())

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Friend knows the player has the letter
;condition on dialogue, set in dialogue
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1RadiantScript Property DLC1Radiant  Auto  
