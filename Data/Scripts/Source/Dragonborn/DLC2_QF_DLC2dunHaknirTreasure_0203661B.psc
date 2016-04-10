;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_QF_DLC2dunHaknirTreasure_0203661B Extends Quest Hidden

;BEGIN ALIAS PROPERTY QT_HaknirsShoalBanditBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_HaknirsShoalBanditBoss Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Display the objective.
if (DLC2dunHaknirTreasureQST.GetStage() == 20)
     SetObjectiveDisplayed(10)
     DLC2HankirsShoalMapMarker.AddToMap()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Complete the objective when the quest starts.
SetObjectiveCompleted(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC2HankirsShoalMapMarker  Auto  

Quest Property DLC2dunHaknirTreasureQST  Auto  
