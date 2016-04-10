;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname DLC1_QF_DLC1RH07_01007EC5 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Jarl
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Jarl Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CapitalHQ
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CapitalHQ Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Letter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Letter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Capital
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Capital Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
DLC1Radiant.QuestAccepted(self)
DLC1RH07NextAllowed.setValue(Utility.GetCurrentGameTime() + 12)
Alias_Vampire.TryToEnable()
Alias_MapMarker.GetReference().AddToMap()
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveCompleted(20)

if getStageDone(100) == false
   SetObjectiveDisplayed(30)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;THERE ARE TWO FINISHING QUEST STAGES
;SEE ALSO 255

Alias_Vampire.GetReference().Delete()

CompleteAllObjectives()
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 0)
DLC1Radiant.StopQuestAndStartNewOneHunter(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
if IsObjectiveCompleted(10) == false
   SetObjectiveDisplayed(10, false)
endif


if IsObjectiveCompleted(20) == false
   SetObjectiveDisplayed(20, false)
endif

if IsObjectiveCompleted(30) == false
   SetObjectiveDisplayed(30, false)
endif

SetObjectiveDisplayed(40) ;in case it's not yet
SetObjectiveCompleted(40)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;THERE ARE TWO FINISHING QUEST STAGES
;SEE ALSO 255

;quest ending because Jarl is no longer in Jarl Faction
Alias_Vampire.GetReference().Delete()

CompleteAllObjectives()
DLC1Radiant.StopQuestAndStartNewOneHunter(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_Jarl.RegisterForUpdate(5)
Alias_Vampire.GetReference().AddItem(Alias_Letter.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Letter.GetReference())
Alias_Vampire.GetActorReference().SetCrimeFaction(None)

SetObjectiveCompleted(10)
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1RadiantScript Property DLC1Radiant  Auto  

GlobalVariable Property DLC1RH07NextAllowed  Auto  
