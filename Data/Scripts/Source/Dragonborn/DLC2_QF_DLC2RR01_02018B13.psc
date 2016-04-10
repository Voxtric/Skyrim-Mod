;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname DLC2_QF_DLC2RR01_02018B13 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RR01Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR01Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR01Ghoul01Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR01Ghoul01Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR01ModynAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR01ModynAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR01AmbushCellAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC2RR01AmbushCellAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR01CariusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR01CariusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR01Ghoul02Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR01Ghoul02Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR01HoldingSafeAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR01HoldingSafeAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR01AttiusFarmCellAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC2RR01AttiusFarmCellAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR01Ghoul03Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR01Ghoul03Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR01Plans
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR01Plans Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR01AltLetterAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR01AltLetterAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Debug Startup Stage
Game.GetPlayer().MoveTo(pDLC2RR01StartMarker)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;This is the setup stage for the quest - Prep the battle at the gate
;Moves Captain Veleth and the Ash Ghouls to outside the Bulwark for the fight
pDLC2RRModynVeleth.SetInvulnerable()
Alias_DLC2RR01ModynAlias.GetActorRef().MoveTo(pDLC2RR01VelethStartMarker)
Alias_DLC2RR01ModynAlias.GetActorRef().EvaluatePackage()
Game.GetPlayer().AddToFaction(pDLC2RR01VelethAllyFaction)
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Player refused quest - keep it in holding pattern
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;This stage is set if Carius is slain before the discovery at the Attius Farm
if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
endif
if IsObjectiveDisplayed(20) == 1
SetObjectiveCompleted(20,1)
endif
Alias_DLC2RR01CariusAlias.GetActorRef().AddItem(Alias_DLC2RR01AltLetterAlias.GetRef())
SetObjectiveDisplayed(80,1)
pDLC2RRModynVeleth.SetInvulnerable(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Surrender notice picked up... give it to Veleth
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Done with Veleth, head to Frostmoth
pDLC2FrostmothMapMarkerRef.AddToMap()
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Player recovered the alternate ending note off of Carius
SetObjectiveCompleted(80,1)
SetObjectiveDisplayed(90,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Done with Veleth... search the farm
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
pDLC2RR01PlansGhoulRef.Enable()
if Game.GetPlayer().GetItemCount(Alias_DLC2RR01Plans.GetRef()) == 1
SetObjectiveCompleted(30,1)
SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Pop the objective when the Player gets to the second level of proximity to the fight or they hit one of the enemy at range
;Remove invulnerable flag on the NPCs
SetObjectiveDisplayed(10,1)
pDLC2RRModynVeleth.SetInvulnerable(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Guard pointed at Captain Veleth
SetObjectiveCompleted(100,1)
SetObjectiveDisplayed(110,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Player read the alternate note - head to a guard
SetObjectiveCompleted(90,1)
SetObjectiveDisplayed(100,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Quest Done
if IsObjectiveDisplayed(70) == 1
SetObjectiveCompleted(70,1)
endif
if IsObjectiveDisplayed(90) == 1
SetObjectiveCompleted(90,1)
endif
if IsObjectiveDisplayed(100) == 1
SetObjectiveCompleted(100,1)
endif
if IsObjectiveDisplayed(110) == 1
SetObjectiveCompleted(110,1)
endif
AchievementsQuest.IncSideQuests()
Game.GetPlayer().AddItem(pDLC2RR01GoldAward)
pDLC2RR00QS.CountQuests()
pDLC2RR01QS.ToggleInvulnerable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Carius is dead - return to Veleth
if IsObjectiveDisplayed(30) == 1
	SetObjectiveCompleted(30,1)
endif
if IsObjectiveDisplayed(40) == 1
	SetObjectiveCompleted(40,1)
endif
if IsObjectiveDisplayed(50) == 1
	SetObjectiveCompleted(50,1)
endif
if IsObjectiveDisplayed(60) == 1
	SetObjectiveCompleted(60,1)
endif
SetObjectiveDisplayed(70,1)
; reenable WEs in exterior
DLC2RR01DisableWEMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Enable the fight when Player gets within proximity
pDLC2RR01GhoulToggle.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Ash ghouls are dead, prompt Veleth to speak to Player -
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pDLC2RR01VelethStartMarker  Auto  

ObjectReference Property pDLC2RR01GhoulToggle  Auto  

ActorBase Property pDLC2RRModynVeleth  Auto  

ActorBase Property pDLC2RR01AttackingAshGhouls  Auto  

ObjectReference Property pDLC2RR01StartMarker  Auto  

ObjectReference Property pDLC2RR01PlansGhoulRef  Auto  

DLC2RR00QuestScript Property pDLC2RR00QS  Auto  

LeveledItem Property pDLC2RR01GoldAward  Auto  

ObjectReference Property pDLC2FrostmothMapMarkerRef  Auto  

AchievementsScript Property AchievementsQuest Auto  

ObjectReference Property DLC2RR01DisableWEMarker  Auto  

Faction Property pDLC2RR01VelethAllyFaction  Auto  

DLC2RR01QuestScript Property pDLC2RR01QS  Auto  
