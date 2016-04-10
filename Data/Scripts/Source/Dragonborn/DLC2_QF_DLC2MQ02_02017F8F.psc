;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 27
Scriptname DLC2_QF_DLC2MQ02_02017F8F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Seeker4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Seeker4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Seeker4SceneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Seeker4SceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Seeker1SceneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Seeker1SceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Seeker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Seeker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2MQ02FreaFollowTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2MQ02FreaFollowTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2MQ02TempleExteriorMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2MQ02TempleExteriorMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ02MiraakDragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ02MiraakDragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ02MiraakApocrypha
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ02MiraakApocrypha Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Oslaf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Oslaf Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Seeker2SceneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Seeker2SceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Seeker3SceneMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Seeker3SceneMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Seeker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Seeker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ02Book01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ02Book01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book01DungeonLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Book01DungeonLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ02BookUpdateTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ02BookUpdateTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2MQ02CultistExtMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2MQ02CultistExtMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Seeker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Seeker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2MQ02DragonHeadtrackMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2MQ02DragonHeadtrackMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ06MiraakDragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ06MiraakDragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2MQ02ExtRamp
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2MQ02ExtRamp Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2MQ02FreaHoldTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2MQ02FreaHoldTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ02Miraak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ02Miraak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ysra
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ysra Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE dlc2mq02questscript
Quest __temp = self as Quest
dlc2mq02questscript kmyQuest = __temp as dlc2mq02questscript
;END AUTOCAST
;BEGIN CODE
;Stage is set by trigger in DLC2TempleofMiraakExterior01
kmyQuest.FreaHold=1
if GetStageDone(5) == 0
SetObjectiveDisplayed(10,1)
SetActive(true)
endif


;TEMP - ignore everything below 





; disable fast travel
;Game.EnableFastTravel(false)

;DLC2MQ02MiraakPrefightScene.Start()
;Actor miraak = Alias_MQ02Miraak.GetActorReference()

; move Miraak into position
;miraak.MoveTo(DLC2MQ01MiraakTempleMarkerRef)

;Enable Miraak and have him force greet the player 
;(miraak as DLC2MiraakScript).Appear(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(60,1)
DLC2ApocryphaFaction.SetEnemy(PlayerFaction)
Game.SetInChargen(false, false, false)
Game.EnablePlayerControls()
; set book data back to reenable controls after moving to apocrypha
DLC2BookDungeonController.SetReenableControls(DLC2BlackBook01RefDATA as DLC2BlackBookScript, true)
; clean up book01 dungeon:
Alias_MQ02MiraakDragon.GetRef().Disable()
Alias_MQ02MiraakApocrypha.GetRef().Disable()
Alias_Seeker1.GetReference().Disable()
Alias_Seeker2.GetReference().Disable()
Alias_Seeker3.GetReference().Disable()
Alias_Seeker4.GetReference().Disable()
;Alias_MQ06MiraakDragon.GetRef().Enable() ; turn on "real" dragon
Alias_Frea.GetActorRef().EvaluatePackage()

;game.GetPlayer().DispelSpell(DLC2DragonAspectHeadSpell)
;game.GetPlayer().DispelSpell(DLC2DragonAspectMiraak)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
SetObjectiveCompleted(60,1)
CompleteAllObjectives()
Alias_Frea.GetActorReference().SetPlayerTeammate(false)
; add achievement
Game.AddAchievement(67)
DLC2MQ03.SetStage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN AUTOCAST TYPE dlc2mq02questscript
Quest __temp = self as Quest
dlc2mq02questscript kmyQuest = __temp as dlc2mq02questscript
;END AUTOCAST
;BEGIN CODE
if IsObjectiveDisplayed(5)
SetObjectiveCompleted(5,1)
endif
if IsObjectiveDisplayed(10)
SetObjectiveCompleted(10,1)
endif
SetObjectiveDisplayed(30,1)
;need to open ramp and enable cultists
Alias_DLC2MQ02CultistExtMarker.getReference().enableNoWait()
Alias_DLC2MQ02ExtRamp.getReference().playAnimation("Open")
; enable fast travel
Game.EnableFastTravel(true)
;Make Frea the player's ally
DLC2MQ02AllyFaction.SetAlly(PlayerFaction)
Alias_Frea.GetActorReference().SetPlayerTeammate()

Alias_Frea.GetActorReference().AddToFaction(PlayerFaction)

; make everyone in Apocrypha non-hostile
DLC2ApocryphaFaction.SetAlly(PlayerFaction)
kmyQuest.FreaHold=1
Alias_Frea.GetActorReference().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
Game.ForceFirstPerson()
Game.SetInCharGen(false,true,false)
Alias_MQ02MiraakApocrypha.GetReference().MoveTo(MiraakApocryphaSceneMarker)
Alias_MQ02MiraakApocrypha.GetReference().Enable()
;Game.DisablePlayerControls()
MiraakApocryphaScene.Start()
; TEMP to stop everyone aggroing on me - won't be necessary once factions are set up ahead of time
Game.GetPlayer().StopCombatAlarm()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
Alias_Frea.GetReference().MoveTo(DLC2MQ02FreaInitialMarker)
DLC2MQ01.SetStage(5)
DLC2MQ01.SetStage(200)
SetStage(10)
; make sure DLC2Init has fired
DLC2Init.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; make Miraak aggressive
Alias_MQ02Miraak.GetActorReference().SetNoBleedoutRecovery(true)
Alias_MQ02Miraak.GetActorRef().StartCombat(Game.GetPlayer())
DLC2MQ02MiraakEnemyFaction.SetEnemy(PlayerFaction)
Alias_MQ02Miraak.GetActorReference().AddToFaction(DLC2MQ02MiraakEnemyFaction)

if IsObjectiveDisplayed(10) == 1
	SetObjectiveCompleted(10)
endif

SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveCompleted(20)
if IsObjectiveDisplayed(5) == 0
SetObjectiveDisplayed(25)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; Miraak defeated
DLC2MQ02MiraakPrefightScene.Stop()
DLC2MQ02MiraakDefeatScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
if GetStage() == 5
If GetStageDone(10) == 0
SetObjectiveDisplayed(5)
endif
endif
;Close out MQ01
DLC2MQ01.SetStage(200)
SetActive(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DLC2MQ02MiraakEnemyFaction  Auto  

Faction Property PlayerFaction  Auto  

ObjectReference Property DLC2MQ02FreaInitialMarker  Auto  

Quest Property DLC2MQ03  Auto  

Scene Property MiraakApocryphaScene  Auto  

ObjectReference Property MiraakApocryphaSceneMarker  Auto  

Quest Property DLC2MQ01  Auto  

Faction Property DLC2ApocryphaFaction  Auto  

ObjectReference Property DLC2BlackBook01PlayerStartMarker  Auto  

Quest Property DLC2Init  Auto  

Scene Property DLC2MQ02MiraakPrefightScene  Auto  

Scene Property DLC2MQ02MiraakDefeatScene  Auto  

ObjectReference Property DLC2MQ01MiraakTempleMarkerRef  Auto  

DLC2BookDungeonControllerScript Property DLC2BookDungeonController  Auto  

dlc2blackbookscript Property DLC2BlackBook01RefDATA  Auto  
{"data" version of the black book
}

Faction Property DLC2MQ02AllyFaction  Auto  

SPELL Property DLC2DragonAspectMiraak  Auto  

SPELL Property DLC2DragonAspectHeadSpell  Auto  
