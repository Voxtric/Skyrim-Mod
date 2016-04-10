;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC1_QF_DLC1RV06_010058CA Extends Quest Hidden

;BEGIN ALIAS PROPERTY QuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spouse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spouse Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
FailAllObjectives()
DLC1Radiant.StopQuestAndStartNewOneVampire(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
CompleteAllObjectives()
DLC1Radiant.GiveQuestReward(ChanceForBloodPotion = 25)
DLC1Radiant.StopQuestAndStartNewOneVampire(self)   ;THIS WILL CALL STOP() ON THIS QUEST
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DLC1Radiant.QuestAccepted(self)
DLC1RV06DoOnce.SetValue(1)
SetObjectiveDisplayed(10)
Game.GetPlayer().AddPerk(DLC1VampireSeductionBoost)
Alias_Spouse.GetActorReference().AddToFaction(DLC1VampireSeductionBoostFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;player talked with spouse after the change
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;set by DLC1VampireTurnScript
;change is completed while player is not present

;*** UNCOMMENT THIS OUT WHEN YOU GET COFFINS IN ALL THE PLAYER HOUSES

;Alias_Coffin.TryToEnable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if Alias_Spouse.GetReference() == FollowerAlias.GetReference()
   DialogueFollower.DismissFollower()
endif

SetObjectiveCompleted(10)
SetObjectiveDisplayed(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1RadiantScript Property DLC1Radiant  Auto  

Faction Property DLC1VampireSeductionBoostFaction  Auto  

Perk Property DLC1VampireSeductionBoost  Auto  

dialoguefollowerscript Property DialogueFollower  Auto  

ReferenceAlias Property FollowerAlias auto

GlobalVariable Property DLC1RV06DoOnce  Auto  
