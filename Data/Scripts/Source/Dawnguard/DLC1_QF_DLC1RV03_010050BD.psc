;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 15
Scriptname DLC1_QF_DLC1RV03_010050BD Extends Quest Hidden

;BEGIN ALIAS PROPERTY questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY City
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_City Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;player killed someone
;CRIME REPORTED: YES
;HIGH PROFILE VICTIM: NO

SetObjectiveCompleted(100)
SetObjectiveCompleted(110)
SetObjectiveFailed(111)

setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;player killed someone
;CRIME REPORTED: NO
;HIGH PROFILE VICTIM: YES

SetObjectiveCompleted(100)
SetObjectiveFailed(110)
SetObjectiveCompleted(111)

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;player killed someone
;CRIME REPORTED: YES
;HIGH PROFILE VICTIM: YES

SetObjectiveCompleted(100)
SetObjectiveCompleted(110)
SetObjectiveCompleted(111)

setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;player killed someone
;CRIME REPORTED: NO
;HIGH PROFILE VICTIM: NO

SetObjectiveCompleted(100)
SetObjectiveFailed(110)
SetObjectiveFailed(111)

setStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DLC1Radiant.QuestAccepted(self)
Game.GetPlayer().AddItem(DLC1RV03HunterArmor)
Game.GetPlayer().AddItem(Alias_Letter.GetReference())
Alias_MapMarker.GetReference().AddToMap()
SetObjectiveDisplayed(111)
SetObjectiveDisplayed(110)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;set keyword data for location to be used in story manager conditions for DLC1RV03KillActorMonitor quest to start
Alias_City.GetLocation().setKeywordData(DLC1RV03KillLocation, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;what used to happen here, now happens in DLC1RV04LetterScript attached to the Letter alias
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
FailAllObjectives()
DLC1Radiant.StopQuestAndStartNewOneVampire(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveDisplayed(200)

;clear keyword data for location to be used in story manager conditions for DLC1RV03KillActorMonitor quest to start
Alias_City.GetLocation().setKeywordData(DLC1RV03KillLocation, 0)

;to start polling to see if the actor gets disabled for some reason we should fail the quest
Alias_Victim.RegisterForSingleUpdate(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
CompleteAllObjectives()
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 25)
DLC1Radiant.StopQuestAndStartNewOneVampire(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property DLC1RV03KillLocation  Auto  

LeveledItem Property DLC1RV03HunterArmor  Auto  

DLC1RadiantScript Property DLC1Radiant  Auto  
