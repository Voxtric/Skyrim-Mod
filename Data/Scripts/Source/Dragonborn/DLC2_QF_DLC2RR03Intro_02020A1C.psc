;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC2_QF_DLC2RR03Intro_02020A1C Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RR03IntroAxeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03IntroAxeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03IntroCresciusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03IntroCresciusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03IntroGloverAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03IntroGloverAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03IntroPlayer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03IntroPlayer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03SafeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03SafeAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player has spoken to Glover
SetObjectiveDisplayed(10,1)
Alias_DLC2RR03IntroCresciusAlias.GetActorRef().AddItem(Alias_DLC2RR03IntroAxeAlias.GetRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Player allows Crescius to keep the axe (dialogue only)
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(30,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player recovered the pickaxe (tracked on pickup, so can be through dialogue or pickpocket)
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Quest Autostarts when game starts
;Meant to run cocurrent with DLC2RR03 - can be done before or after
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Quest Done
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
elseif IsObjectiveDisplayed(30) == 1
SetObjectiveCompleted(30,1)
endif
if pDLC2RR03Intro01.GetValue() == 1
Game.GetPlayer().AddItem(pFavorRewardGoldSmall)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pDLC2RR03CresciusStartMarker  Auto  

LeveledItem Property pFavorRewardGoldSmall  Auto  

GlobalVariable Property pDLC2RR03Intro01  Auto  
