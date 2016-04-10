;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname DLC1_QF_DLC1RH06_01007201 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BoundCaptiveMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BoundCaptiveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Questgiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Questgiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spouse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Dungeon
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Dungeon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CaptiveMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CaptiveMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Friend
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Friend Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Prisoner
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Prisoner Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
debug.trace(self + "Stage 60")

;player rescued prisoner
SetObjectiveCompleted(11)

if getStageDone(50) == false
   SetObjectiveDisplayed(10, abForce = true) ;remind player
else
   setStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
debug.trace(self + "Stage 50")

;player rescued prisoner
SetObjectiveCompleted(10)
Alias_Prisoner.GetActorReference().SetRestrained(false)

if getStageDone(60) == false
   SetObjectiveDisplayed(11, abForce = true) ;remind player
else
   setStage(100)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
debug.trace(self + "Stage 100")

SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;NOTE: THIS QUEST IS PRIORITY 50 so it sits higher than RelationshipMarriageFIN

DLC1Radiant.QuestAccepted(self)

Alias_Vampire.TryToEnable()
DLC1Radiant.GimpAlias(Alias_Boss); mods health, stamina, and magicka to make it easier

Alias_MapMarker.GetReference().AddToMap()
SetObjectiveDisplayed(10)
SetObjectiveDisplayed(11)

;Move prisoner
Alias_Prisoner.TryToMoveTo(Alias_BoundCaptiveMarker.GetReference())
Alias_Prisoner.GetActorReference().EvaluatePackage()
utility.Wait(2)
Alias_Prisoner.GetActorReference().SetRestrained(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Alias_BoundCaptiveMarker.GetReference().Delete()

CompleteAllObjectives()
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 0)
DLC1Radiant.StopQuestAndStartNewOneHunter(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1RadiantScript Property DLC1Radiant  Auto  
