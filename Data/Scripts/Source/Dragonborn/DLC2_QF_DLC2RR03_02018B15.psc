;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname DLC2_QF_DLC2RR03_02018B15 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RR03CresciusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03CresciusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03ExteriorQuestTargetAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03ExteriorQuestTargetAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03GratianSkeletonAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03GratianSkeletonAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03AphiaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03AphiaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03BloodskalLocAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC2RR03BloodskalLocAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03QuestTargetAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03QuestTargetAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03BloodskalBladeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03BloodskalBladeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03GratianJournalAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03GratianJournalAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03MineKeyAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03MineKeyAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03SafeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03SafeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03LetterAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03LetterAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03SeekerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03SeekerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player done with Crescius's offer
SetObjectiveCompleted(5,1)
SetObjectiveDisplayed(10,1)
Game.GetPlayer().AddItem(Alias_DLC2RR03MineKeyAlias.GetRef())
Game.GetPlayer().AddItem(Alias_DLC2RR03LetterAlias.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player is in the exterior of Bloodskal Barrow
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
if IsObjectiveDisplayed(20)
SetObjectiveDisplayed(20,0)
endif
Alias_DLC2RR03CresciusAlias.GetActorRef().Enable()
Alias_DLC2RR03CresciusAlias.GetActorRef().EvaluatePackage()
Alias_DLC2RR03AphiaAlias.GetActorRef().Enable()
Alias_DLC2RR03AphiaAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player hit trigger near the gate, disabling Crescius and evping Aphia for handling purposes
Alias_DLC2RR03CresciusAlias.GetActorRef().Disable()
Alias_DLC2RR03AphiaAlias.GetActorRef().Disable()
Alias_DLC2RR03AphiaAlias.GetActorRef().MoveTo(pDLC2RR03GoHomeMarker)
Alias_DLC2RR03CresciusAlias.GetActorRef().MoveTo(pDLC2RR03GoHomeMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player read the Journal - Time to escape!
SetObjectiveCompleted(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Startup
;Move Aphia and Crescius into Position
Alias_DLC2RR03AphiaAlias.GetActorRef().MoveTo(pDLC2RR03AphiaStartMarker)
Alias_DLC2RR03AphiaAlias.GetActorRef().EvaluatePackage()
Alias_DLC2RR03CresciusAlias.GetActorRef().MoveTo(pDLC2RR03CresciusStartMarker)
Alias_DLC2RR03CresciusAlias.GetActorRef().EvaluatePackage()
pDLC2BloodskalBladeQST.Start()
Alias_DLC2RR03GratianSkeletonAlias.GetActorRef().additem(Alias_DLC2RR03BloodskalBladeAlias.getRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player located the journal on Gratian's remains
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(30,1)
if pDLC2RR03AlreadyRead.GetValue() == 0
SetObjectiveDisplayed(20,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Triggered near line of questioning
SetObjectiveDisplayed(5,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player spoke to Crescius for final time
SetObjectiveCompleted(40,1)
AchievementsQuest.IncSideQuests()
Game.GetPlayer().AddItem(pFavorRewardGoldSmall)
pDLCRR00QS.CountQuests()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pDLC2RR03AphiaStartMarker  Auto  

ObjectReference Property pDLC2RR03CresciusStartMarker  Auto  

DLC2RR00QuestScript Property pDLCRR00QS  Auto  

Quest Property pDLC2BloodskalBladeQST  Auto  

Quest Property pDLC2RR03Mine  Auto  

ObjectReference Property pDLC2RR03GoHomeMarker  Auto  

LeveledItem Property pFavorRewardGoldSmall  Auto  

AchievementsScript Property AchievementsQuest  Auto  

GlobalVariable Property pDLC2RR03AlreadyRead  Auto  
