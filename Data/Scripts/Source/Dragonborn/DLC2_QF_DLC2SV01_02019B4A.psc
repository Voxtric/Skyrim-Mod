;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 42
Scriptname DLC2_QF_DLC2SV01_02019B4A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Miniboss2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Miniboss2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TombLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TombLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalfClaw1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalfClaw1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vahlok
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vahlok Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tharstan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tharstan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Miniboss1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Miniboss1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DungeonBlocker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DungeonBlocker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Solstheim
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Solstheim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TombDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TombDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Keyhole
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Keyhole Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HalfClaw2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HalfClaw2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FourthPuzzleSolveTriggers
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FourthPuzzleSolveTriggers Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;Set when Tharstan approaches the Final puzzle's Third button.

DLC2SV01FinalPuzzleThirdButtonIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_36
Function Fragment_36()
;BEGIN CODE
Utility.Wait(5)

;Manage objectives
SetObjectiveCompleted(40)
SetObjectiveDisplayed(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
;Riddle 4 has been translated
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;Gets set when the player makes it half way through puzzle 3

DLC2SV01ThirdPuzzleIntro.Stop()
DLC2SV01ThirdPuzzleMistake.Stop()
DLC2SV01ThirdPuzzleHalfway.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;Stage that gets set when the player puts the second half-claw in the lock

DLC2SV01PlaceFirstHalfClaw.Stop()
SetStage(330)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Gets set when the player makes his first mistake in puzzle 3.

DLC2SV01ThirdPuzzleIntro.Stop()
DLC2SV01ThirdPuzzleMistake.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
;Set when the player presses the Final puzzles First button

DLC2SV01FinalPuzzleFirstButtonIntro.Stop()
DLC2SV01FinalPuzzleFirstButtonPress.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;Set when Tharstan approaches the Final puzzle's Second button.

DLC2SV01FinalPuzzleSecondButtonIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;Gets set when the player solves the third puzzle.

DLC2SV01ThirdPuzzleIntro.Stop()
DLC2SV01ThirdPuzzleMistake.Stop()
DLC2SV01ThirdPuzzleHalfway.Stop()
DLC2SV01ThirdPuzzleComplete.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
;Set when the player is about half-way through the puzzle, only set once

DLC2SV01FourthPuzzleIntro.Stop()
DLC2SV01FourthPuzzleSwitch.Stop()
DLC2SV01FourthPuzzleHalfway.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_39
Function Fragment_39()
;BEGIN CODE
;Riddle 3 has been translated
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Manage objectives
SetObjectiveCompleted(45)
SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Move Tharstan into the dungeon
Alias_Tharstan.GetReference().MoveTo(DLC2SV01TharstanMarker)

;Manage objectives
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)

;Start Tharstan's scene
DLC2SV01TharstanTombIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Manage objectives
SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Manage objectives
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;Set Tharstan to be the player's teammate
Alias_Tharstan.GetActorRef().SetPlayerTeammate(abCanDoFavor = False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Quest Done
SetObjectiveCompleted(50,1)
Game.GetPlayer().AddItem(Gold001, 1000)
AchievementsQuest.IncSideQuests()

;Remove Tharstan from being the player's teammate
;Set Tharstan to be the player's teammate
Alias_Tharstan.GetActorRef().SetPlayerTeammate(False)

;Start the post quest
DLC2SV01Post.Start()

;Mark the dungeon as cleared
(Alias_TombLocation.GetLocation()).SetCleared()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
;Set when player gets near barred door after falling into the water during the final puzzle.

DLC2SV01FinalPuzzleAfterPlayerFall.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
;Riddle 2 has been translated
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Set when the puzzle door is opened

SetStage(345)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;Set when the player reaches the first final puzzle platform

Alias_Tharstan.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;Set once the player starts the Fourth puzzle. (After placing the second half-claw in the lock)

((self as Quest) as DLC2SV01ConditionsSCRIPT).bPlayerAtPuzzle04 = TRUE

if GetStageDone(335) == FALSE
    DLC2SV01FourthPuzzleIntro.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Stage that gets set when the player puts the first half-claw in the lock

DLC2SV01PlaceFirstHalfClaw.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Gets set when the player makes his first successful strike of a statue in the 2nd puzzle.
;Stops the previous two possible scenes and starts the DLC2SV01SecondPuzzleSuccess scene

DLC2SV01SecondPuzzleIntro.Stop()
DLC2SV01SecondPuzzleMistake.Stop()
DLC2SV01SecondPuzzleSuccess.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Set when Tharstan approaches the Final puzzle's First button.

DLC2SV01FinalPuzzleFirstButtonIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Set by trigger once Tharstan enters the Second puzzle chamber.
;Starts the DLC2SV01SecondPuzzleSceneIntro scene.

if GetStageDone(315) == FALSE
    DLC2SV01SecondPuzzleIntro.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Gets set when the player makes his first mistake in puzzle 2.
;Stops the DLC2SV01SecondPuzzleInro scene, and starts DLC2SV01SecondPuzzleMistake if the success scene hasn't already played

if GetStageDone(313) == FALSE
	DLC2SV01SecondPuzzleIntro.Stop()
	DLC2SV01SecondPuzzleMistake.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;Set when the player presses the Final puzzles First button

DLC2SV01FinalPuzzleSecondButtonIntro.Stop()
DLC2SV01FinalPuzzleSecondButtonPress.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
;Set once Tharsten gets into the Hall of Stories

if (GetStageDone(345) == FALSE)
    DLC2SV01HOSIntro.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
;Set when the player reaches the fourth final puzzle platform

Alias_Tharstan.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;Set when the player has reached the end of the puzzle.

((self as Quest) as DLC2SV01ConditionsSCRIPT).bPlayerAtPuzzle04 = FALSE
DLC2SV01FourthPuzzleIntro.Stop()
DLC2SV01FourthPuzzleSwitch.Stop()
DLC2SV01FourthPuzzleHalfway.Stop()
DLC2SV01FourthPuzzleComplete.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_41
Function Fragment_41()
;BEGIN CODE
;Set when Tharstan has initially force-greeted the player
;Used tp prevent repetitive Force-greets
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Gets set when the player solves the first puzzle.
;This tells the DLC2SV01FirstPuzzleComplete to start, and stops all other scenes

((self as Quest) as DLC2SV01ConditionsSCRIPT).bPlayerAtPuzzle01 = FALSE
DLC2SV01FirstPuzzleIntro.Stop()
DLC2SV01FirstPuzzleComplete.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Set by trigger once Tharstan enters the main chamber.
;Starts the DLC2SV01FirstPuzzleIntro scene, and sets player as being in puzzle 1

((self as Quest) as DLC2SV01ConditionsSCRIPT).bPlayerAtPuzzle01 = TRUE
if GetStageDone(305) == FALSE
    DLC2SV01TharstanTombIntro.Stop()
    DLC2SV01FirstPuzzleIntro.Start()
endif

SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;Set when the player pulls the lever to turn the 4th puzzle on

Alias_FourthPuzzleSolveTriggers.GetReference().EnableNoWait()

DLC2SV01FourthPuzzleIntro.Stop()
DLC2SV01FourthPuzzleSwitch.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
;Set when the player reaches the second final puzzle platform

Alias_Tharstan.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_37
Function Fragment_37()
;BEGIN CODE
;Riddle 1 has been translated
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
;Set by trigger once Tharstan enters the Third puzzle chamber.

if GetStageDone(325) == FALSE
    DLC2SV01ThirdPuzzleIntro.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10)

;Unblocks the dungeon entrance.
Alias_DungeonBlocker.GetReference().DisableNoWait()

;Adds the map marker
DLC2VahloksTombMapMarker.Enable()
DLC2VahloksTombMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;Set once the player solves the Hall of Stories door

DLC2SV01HOSIntro.Stop()
DLC2SV01HOSComplete.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Gets set when the player solves the second puzzle.
;This tells the DLC2SV01SecondPuzzleComplete start, and stops all other scenes

DLC2SV01SecondPuzzleIntro.Stop()
DLC2SV01SecondPuzzleMistake.Stop()
DLC2SV01SecondPuzzleSuccess.Stop()
DLC2SV01SecondPuzzleComplete.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_34
Function Fragment_34()
;BEGIN CODE
;Set when the player reaches the third final puzzle platform

Alias_Tharstan.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC2SV01TharstanMarker  Auto  

ObjectReference Property DLC2SVTharstanRef  Auto  

Scene Property DLC2SV01SecondPuzzleIntro  Auto  

Scene Property DLC2SV01SecondPuzzleComplete  Auto  

Scene Property DLC2SV01SecondPuzzleMistake  Auto  

Scene Property DLC2SV01SecondPuzzleSuccess  Auto  

Scene Property DLC2SV01FirstPuzzleIntro  Auto  

Scene Property DLC2SV01FirstPuzzleComplete  Auto  

Scene Property DLC2SV01ThirdPuzzleIntro  Auto  

Scene Property DLC2SV01ThirdPuzzleMistake  Auto  

Scene Property DLC2SV01ThirdPuzzleHalfway  Auto  

Scene Property DLC2SV01ThirdPuzzleComplete  Auto  

Scene Property DLC2SV01PlaceFirstHalfClaw  Auto  

Scene Property DLC2SV01FourthPuzzleIntro  Auto  

Scene Property DLC2SV01FourthPuzzleSwitch  Auto  

Scene Property DLC2SV01FourthPuzzleHalfway  Auto  

Scene Property DLC2SV01FourthPuzzleComplete  Auto  

Scene Property DLC2SV01FinalPuzzleFirstButtonIntro  Auto  

Scene Property DLC2SV01FinalPuzzleFirstButtonPress  Auto  

Scene Property DLC2SV01FinalPuzzleSecondButtonIntro  Auto  

Scene Property DLC2SV01FinalPuzzleSecondButtonPress  Auto  

Scene Property DLC2SV01FinalPuzzleThirdButtonIntro  Auto  

Scene Property DLC2SV01FinalPuzzleAfterPlayerFall  Auto  

Scene Property DLC2SV01HOSIntro  Auto  

Scene Property DLC2SV01HOSComplete  Auto  

ObjectReference Property DLC2VahloksTombMapMarker  Auto  

MiscObject Property Gold001  Auto  

Scene Property DLC2SV01TharstanTombIntro  Auto  

Quest Property DLC2SV01Post  Auto  

AchievementsScript Property AchievementsQuest  Auto
