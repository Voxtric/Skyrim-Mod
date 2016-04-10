;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 11
Scriptname DLC1_QF_DLC1VQDragon_0100C73A Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC1VQDragonAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQDragonAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQDragonSoulCairn
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC1VQDragonSoulCairn Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Summoned Durnehviir three times, he's taught last word of shout
SetObjectiveCompleted(40,1)
Game.AddAchievement(55)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Initial talk with Durnehviir, he is now summonable
SetObjectiveDisplayed(10,1)
SetObjectiveDisplayed(20,1)
Game.TeachWord(pDLC1DragonSummon1Dur)
Game.TeachWord(pDLC1DragonSummon2Neh)
Game.TeachWord(pDLC1DragonSummon3Viir)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player exited Soul Cairn (for AI packages on Durnehviir)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Summoned Durnehviir once, he's taught first word of shout
SetObjectiveCompleted(10,1)
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Debug Fast Start
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;This is initiated after the Player slays Durnehviir - this silently starts the quest and does the setup
;This fires after he "dies" in the Soul Cairn
Alias_DLC1VQDragonAlias.GetActorRef().Resurrect()
Alias_DLC1VQDragonAlias.GetActorRef().RemoveFromFaction(pDLC1DurnehviirEnemyFaction)
Alias_DLC1VQDragonAlias.GetActorRef().AddToFaction(pDLC1DurnehviirFaction)
Alias_DLC1VQDragonAlias.GetActorRef().SetAv("Aggression",0)
Alias_DLC1VQDragonAlias.GetActorRef().MoveTo(pDLC1VQDragonPerchRef)
Alias_DLC1VQDragonAlias.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player dismissed Durnehviir without finishing (kick out of dialogue, etc.)
;Pops the Misc Objective in DLC1VQDragonMisc
Alias_DLC1VQDragonAlias.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Summoned Durnehviir twice, he's taught second word of shout
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDLC1VQDragonMisc  Auto  

Quest Property pDLC1VQ05  Auto  

Faction Property pDLC1DurnehviirEnemyFaction  Auto  

Faction Property pDLC1DurnehviirFaction  Auto  

ObjectReference Property pDLC1VQDragonPerchRef  Auto  

Shout Property pDLC1SummonDragonShout  Auto  

WordOfPower Property pDLC1DragonSummon1Dur  Auto  

WordOfPower Property pDLC1DragonSummon2Neh  Auto  

WordOfPower Property pDLC1DragonSummon3Viir  Auto  
