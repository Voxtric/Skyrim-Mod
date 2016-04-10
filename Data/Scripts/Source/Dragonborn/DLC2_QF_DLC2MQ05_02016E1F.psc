;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 99
Scriptname DLC2_QF_DLC2MQ05_02016E1F Extends Quest Hidden

;BEGIN ALIAS PROPERTY Storn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Storn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Cube4Centurion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Cube4Centurion Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Miraak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Miraak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book2Tamriel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book2Tamriel Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakCube02_AsQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakCube02_AsQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakTargetNull
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakTargetNull Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakTarget05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakTarget05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakTarget01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakTarget01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nchardak
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Nchardak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakReadingRoomDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakReadingRoomDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakCube05_AsQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakCube05_AsQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ReadingRoomButton
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ReadingRoomButton Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakTarget02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakTarget02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakCube01_AsQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakCube01_AsQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakTarget04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakTarget04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakCube03_AsQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakCube03_AsQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakCube04_AsQuestItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakCube04_AsQuestItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY NchardakTarget03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_NchardakTarget03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossCenturion
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossCenturion Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; player tells Neloth about search for books
; debug.trace(self + " stage 20")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_79
Function Fragment_79()
;BEGIN CODE
; Neloth has mentioned attacking Steam Centurion
;Alias_Neloth.GetActorRef().StartCombat(Alias_BossCenturion.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_68
Function Fragment_68()
;BEGIN CODE
; player enters Aqueduct
DLC2MQ04NchardakAqueductScene2.Start()
DLC2MQ04NchardakAqueductScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_77
Function Fragment_77()
;BEGIN CODE
; player exits tunnel with cube 5
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_47
Function Fragment_47()
;BEGIN CODE
; player past fire trap in Workshop
; failsafe:
; kill the boiler room scene
DLC2MQ04NchardakBoilerRoomStart.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_92
Function Fragment_92()
;BEGIN CODE
; player returns to reading room after turning on boilers
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_45
Function Fragment_45()
;BEGIN CODE
; player has first cube from Workshop (fire trap pillar)
; kill the boiler room scene
DLC2MQ04NchardakBoilerRoomStart.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
; Neloth tells player about Nchardak
; debug.trace(self + " stage 50")
SetObjectiveCompleted(10) ; talk to Neloth
SetObjectiveDisplayed(20) ; travel to Nchardak
NchardakMapMarker.AddToMap()
Alias_Neloth.GetActorRef().EvaluatePackage()
;Nchardak Management: Reset bandits in the exterior.
DLC2dunNchardakTracking.SetStage(10)
; turn off levitation trigger until Neloth is outside
DLC2LevitationTriggerRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_75
Function Fragment_75()
;BEGIN CODE
; player gets all 3 bridges down
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_94
Function Fragment_94()
;BEGIN CODE
; Neloth outside - reenable levitation trigger
DLC2LevitationTriggerRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_81
Function Fragment_81()
;BEGIN CODE
; steam centurion dead
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
; put cube in pillar to open exterior door
(DLC2dunNchardakExteriorPedestal as DLC2dunNchardakPedestalScript).InsertCubeNeloth()
; disable door trigger
ReadingRoomDoorTrigger.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
; Miraak's scene done - he disappears - transition to next objective
;(Alias_Miraak.GetActorRef() as DLC2MiraakScript).Disappear()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player enters dome
; debug.trace(self + " stage 150")
SetObjectiveCompleted(20)
SetStage(230)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; start quest
; debug.trace(self + " stage 10")
SetObjectiveDisplayed(10)
SetActive(true)
; for now, start MQ03B here
DLC2MQ03B.SetStage(5)
; Tel Mithryn map marker
TelMithrynMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_49
Function Fragment_49()
;BEGIN CODE
; Neloth takes cube from fire trap pillar
(DLC2dunNchardakCube02Pedestal as DLC2dunNchardakPedestalScript).RemoveCubeNeloth()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_52
Function Fragment_52()
;BEGIN CODE
; player raises stairs
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_40
Function Fragment_40()
;BEGIN CODE
; open book contraption
CompleteAllObjectives()
; add achievement
Game.AddAchievement(68)

; transition to MQ05
DLC2MQ05.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_50
Function Fragment_50()
;BEGIN CODE
; player crosses bridge
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_55
Function Fragment_55()
;BEGIN CODE
; player opens door to next room
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_33
Function Fragment_33()
;BEGIN CODE
; Neloth places cube in boiler room pumping pedestal
(DLC2dunNchardakBoilerRoomPedestal as DLC2dunNchardakPedestalScript).InsertCubeNeloth()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_57
Function Fragment_57()
;BEGIN CODE
; player gets cube #4
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
; player and Neloth are both in door trigger - this stage is not used for anything
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_38
Function Fragment_38()
;BEGIN CODE
; clean up

; clear DLC2Init location alias (reserves it)
DLC2NchardakLocationAlias.Clear()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_60
Function Fragment_60()
;BEGIN CODE
; player raises bridge blocking stairs
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; Neloth explains that need to turn on steam to room
; change QT to boiler room
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_44
Function Fragment_44()
;BEGIN CODE
;Neloth inserts his cube into the elevator pillar.
(DLC2dunNchardakElevatorPedestal as DLC2dunNchardakPedestalScript).InsertCubeNeloth()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_71
Function Fragment_71()
;BEGIN CODE
; player returns to Great Hall with all cubes
DLC2MQ04NchardakEndScene.Start()
DLC2MQ04NchardakAqueductScene2.Stop()
; failsafe - make sure 450 is set
SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_73
Function Fragment_73()
;BEGIN CODE
; Neloth hits Great Hall entrance trigger
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_64
Function Fragment_64()
;BEGIN CODE
; player opens door to Aqueduct level
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_66
Function Fragment_66()
;BEGIN CODE
; player gets 5th cube
; lower all bridges to Neloth can advance
(DLC2dunNchardakAqueductPuzzleController as DLC2dunNchardakAqueductController).SetPuzzleCompleted()

;DLC2NchardakAqueductBridge1.SetOpen(false)
;DLC2NchardakAqueductBridge2.SetOpen(false)
;DLC2NchardakAqueductBridge3.SetOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_90
Function Fragment_90()
;BEGIN CODE
; Neloth done talking, let's go to Nchardak!
DLC2MQ04TelMithrynExit.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_53
Function Fragment_53()
;BEGIN CODE
; player retrieves cube #3
DLC2MQ04NchardakWorkshopScene2.Start()
DLC2MQ04NchardakWorkshopScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_88
Function Fragment_88()
;BEGIN CODE
; gain access to book objective
SetObjectiveDisplayed(40)
; first objective is the book itself
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_96
Function Fragment_96()
;BEGIN CODE
; Neloth gets across the 3rd bridge
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_62
Function Fragment_62()
;BEGIN CODE
; start aqueduct scene
DLC2MQ04NchardakAqueductScene.Start()
DLC2MQ04NchardakWorkshopScene2.Stop()
DLC2MQ04NchardakWorkshopScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_51
Function Fragment_51()
;BEGIN CODE
; player uses one of the water pedestals in the main room
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_70
Function Fragment_70()
;BEGIN CODE
; Neloth takes cube from Aqueduct pumps (one of them or all)
(DLC2dunNchardak03PumpingPedestal as DLC2dunNchardakPedestalScript).RemoveCubeNeloth()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_35
Function Fragment_35()
;BEGIN CODE
; start boiler room scene
DLC2MQ04NchardakBoilerRoomStart.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE dlc2mq04script
Quest __temp = self as Quest
dlc2mq04script kmyQuest = __temp as dlc2mq04script
;END AUTOCAST
;BEGIN CODE
; player has powered up the reading room
SetObjectiveCompleted(40) ; repair reading room
SetObjectiveDisplayed(50) ; open book box
; TEMP - set the boiler variable to true
kmyQuest.bReadingRoomPowered = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_83
Function Fragment_83()
;BEGIN CODE
; for quickstart - stop all scenes
DLC2MQ04NchardakAqueductScene.Stop()
DLC2MQ04NchardakAqueductScene2.Stop()
DLC2MQ04NchardakWorkshopScene.Stop()
DLC2MQ04NchardakWorkshopScene2.Stop()
DLC2MQ04NchardakArrival.Stop()
;DLC2MQ04NchardakEndScene.Stop()
Alias_Miraak.GetRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; player arrives at Nchardak
; start scene
DLC2MQ04NchardakArrival.Start()
; enable door trigger
ReadingRoomDoorTrigger.Enable()
; failsafe
setstage(70)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
; quickstart
DLC2MQ03.SetStage(0) ; start
DLC2MQ03.SetStage(50) ; teach word
DLC2MQ03.SetStage(70) ; disable pillar, barrier
DLC2MQ03.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; Neloth explains the need to find cubes
; give player objectives to the cubes
DLC2MQ04NchardakWorkshopScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_42
Function Fragment_42()
;BEGIN CODE
; start boiler room console scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_98
Function Fragment_98()
;BEGIN CODE
; player exits Tel Mithryn - kill levitation scene if running
DLC2MQ04TelMithrynExit.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Miraak defeated
;SetObjectiveCompleted(30)
; hold him in bleedout
;Alias_Miraak.GetActorRef().SetNoBleedoutRecovery(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_59
Function Fragment_59()
;BEGIN CODE
; player past collapsed hallway
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2MQ04  Auto  

Quest Property DLC2MQ06  Auto  

Quest Property DLC2MQ03  Auto  

Quest Property DLC2MQ05  Auto  


Scene Property DLC2MQ04NchardakArrival  Auto  

ObjectReference Property NchardakMapMarker  Auto  

ObjectReference Property ReadingRoomDoorTrigger  Auto  

ObjectReference Property DLC2dunNchardakExteriorPedestal  Auto  
{exterior reading room door pillar}

ObjectReference Property DLC2dunNchardakBoilerRoomPedestal  Auto  

Scene Property DLC2MQ04NchardakBoilerRoomStart  Auto  

Scene Property DLC2MQ04NchardakEndScene  Auto  

Quest Property DLC2dunNchardakTracking  Auto  

ObjectReference Property DLC2dunNchardakElevatorPedestal  Auto  

LocationAlias Property DLC2NchardakLocationAlias  Auto  

ObjectReference Property DLC2dunNchardakCube02Pedestal  Auto  

Scene Property DLC2MQ04NchardakWorkshopScene2  Auto  

Scene Property DLC2MQ04NchardakWorkshopScene  Auto  

Scene Property DLC2MQ04NchardakAqueductScene  Auto  

Scene Property DLC2MQ04NchardakAqueductScene2  Auto  

ObjectReference Property DLC2dunNchardak03PumpingPedestal  Auto  

Scene Property DLC2TelMithrynIntroScene  Auto  

Quest Property DLC2MQ03B  Auto  

ObjectReference Property TelMithrynMapMarker  Auto  

ObjectReference Property DLC2LevitationTriggerRef  Auto  

Scene Property DLC2MQ04TelMithrynExit  Auto  

ObjectReference Property DLC2dunNchardakAqueductPuzzleController  Auto  
