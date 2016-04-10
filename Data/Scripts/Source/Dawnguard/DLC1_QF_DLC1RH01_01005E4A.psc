;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC1_QF_DLC1RH01_01005E4A Extends Quest Hidden

;BEGIN ALIAS PROPERTY target
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_target Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Habitation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Habitation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HabitationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HabitationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Inn
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Inn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY InnCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_InnCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
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
Alias_Target.TryToEnable()
DLC1Radiant.QuestAccepted(self)
Alias_MapMarker.GetReference().AddToMap()
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;create target
DLC1Radiant.CreateDisguisedVampire(Alias_Target, Alias_InnCenterMarker) ;is initally disabled
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
CompleteAllObjectives()
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 0)
DLC1Radiant.StopQuestAndStartNewOneHunter(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1RadiantScript Property DLC1Radiant  Auto  
