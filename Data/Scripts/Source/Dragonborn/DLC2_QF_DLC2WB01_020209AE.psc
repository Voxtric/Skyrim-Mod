;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname DLC2_QF_DLC2WB01_020209AE Extends Quest Hidden

;BEGIN ALIAS PROPERTY JournalChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_JournalChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Journal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Journal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Torkild
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Torkild Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Wulf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Wulf Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
setObjectiveCompleted(15)
setObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(20)

Alias_Wulf.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)

int count = 0
while (count < Skills.length)
   Game.IncrementSkill(Skills[count])
   count += 1
endWhile

AchievementsQuest.IncSideQuests()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
FailAllObjectives()

if (DLC2WESL01.IsRunning())
    DLC2WESL01.Stop()
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; nothing
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(10)
setObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
SetObjectiveCompleted(20)

Alias_Wulf.GetActorReference().SetRelationshipRank(Game.GetPlayer(), 1)

int count = 0
while (count < Skills.length)
   Game.IncrementSkill(Skills[count])
   count += 1
endWhile

AchievementsQuest.IncSideQuests()

SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
SetObjectiveDisplayed(10)

;ShrineMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
SetObjectiveCompleted(10)
setObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

String[] Property Skills  Auto  

ObjectReference Property ShrineMapMarker  Auto  

Quest Property DLC2WESL01  Auto  

AchievementsScript Property AchievementsQuest  Auto  
