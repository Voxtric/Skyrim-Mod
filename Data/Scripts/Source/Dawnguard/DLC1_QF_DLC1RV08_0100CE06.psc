;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname DLC1_QF_DLC1RV08_0100CE06 Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Boss1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Boss1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossContainer2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossContainer2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location2
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Item1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Item1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location1
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MapMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MapMarker2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
CompleteAllObjectives()
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 100)
DLC1Radiant.StopQuestAndStartNewOneVampire(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player found all the items
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DLC1Radiant.QuestAccepted(self)

DLC1RV08DoOnce.SetValue(1)

;Objectives turned on below (must be after items are moved or QTs are weird)
Alias_Item1.TryToEnable()
Alias_Item2.TryToEnable()

Alias_Boss1.GetReference().AddItem(Alias_Item1.GetReference())
Alias_BossContainer2.GetReference().AddItem(Alias_Item2.GetReference())

Alias_MapMarker1.GetReference().AddToMap()
Alias_MapMarker2.GetReference().AddToMap()

SetObjectiveDisplayed(110)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(110)

if IsObjectiveCompleted(110) && IsObjectiveCompleted(120)
   setStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(120)

if IsObjectiveCompleted(110) && IsObjectiveCompleted(120)
   setStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1RadiantScript Property DLC1Radiant  Auto  

GlobalVariable Property DLC1RV08DoOnce  Auto  
