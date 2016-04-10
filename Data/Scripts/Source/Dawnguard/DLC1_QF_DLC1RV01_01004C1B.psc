;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname DLC1_QF_DLC1RV01_01004C1B Extends Quest Hidden

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

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;create target
DLC1Radiant.CreateDisguisedHunter(Alias_Target, Alias_InnCenterMarker) ;is initally disabled
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;kill event came through not a crime
;see DLC1RadiantCrimeMonitorScript on DLC1RVKillActorMonitor
setObjectiveCompleted(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
CompleteAllObjectives()
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 25)
DLC1Radiant.StopQuestAndStartNewOneVampire(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Assault or Kill event came through as a reported crime
;See DLC1RadiantCrimeMonitorScript on DLC1RV01AssaultMonitor and DLC1RV01KillActorMonitor quests
setObjectiveFailed(11)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DLC1Radiant.QuestAccepted(self)
Alias_MapMarker.GetReference().AddToMap()
SetObjectiveDisplayed(11)
SetObjectiveDisplayed(10)
Alias_Target.TryToEnable()
DLC1Radiant.AddAliasToCrimeFactionForCurrentLocation(Alias_Target)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1RadiantScript Property DLC1Radiant  Auto  
