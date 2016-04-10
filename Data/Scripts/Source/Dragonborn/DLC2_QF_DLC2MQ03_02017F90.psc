;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname DLC2_QF_DLC2MQ03_02017F90 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Aeta
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Aeta Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Nikulas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Nikulas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Fanari
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Fanari Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindStoneMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindStoneMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Finna
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Finna Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LurkerMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LurkerMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WindStoneAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WindStoneAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WordWallTargetMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WordWallTargetMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Storn
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Storn Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Lurker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Lurker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SaeringsWatchMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SaeringsWatchMapMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
DLC2MQ02.SetStage(0)
DLC2MQ02.SetStage(60) ; disable MQ02 miraak and dragon
DLC2MQ02.SetStage(200)
; give player book 1
Game.GetPlayer().AddItem(DLC2BlackBook01)
;if (DLC2MQ02.GetStage() != 200)
;Alias_Frea.GetReference().Moveto(Game.GetPlayer())
;SetStage(10)
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
If IsObjectiveDisplayed(30)==1
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
If IsObjectiveDisplayed(20)==1
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
Alias_SaeringsWatchMapMarker.GetReference().AddToMap()
Alias_WindStoneMapMarker.GetReference().AddtoMap()

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
if IsObjectiveDisplayed(10) == 1
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; complete quest
CompleteAllObjectives()
; start MQ04
DLC2MQ04.SetStage(10)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;this stage is now set on the wordwalltrigger script at Saering's Watch.
if IsObjectiveDisplayed(30)==1
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(50,1)
endif
;Game.TeachWord(DLC2VoiceBendToWill1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
If IsObjectiveDisplayed(60)==1
SetObjectiveCompleted(60,1)
SetObjectiveDisplayed(70,1)
endif
DLC2MQ03SkaalVillageBarrier.Disable()
; disable pillar marker - redundant but will allow quickstart to do it
DLC2PillarBuildSandboxMarkerTOGGLEWind.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
if DLC2MQ02.GetStage() == 200
SetObjectiveDisplayed(10,1)
endif
SetActive(true)
FreaStornScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
If IsObjectiveDisplayed(50)==1
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
endif
DLC2SkaalFaction.SetAlly(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2MQ04  Auto  

Quest Property DLC2MQ02  Auto  

WordofPower Property DLC2VoiceBendToWill1  Auto  

Scene Property FreaStornScene  Auto  

ObjectReference Property DLC2MQ03SkaalVillageBarrier  Auto  

ObjectReference Property DLC2PillarBuildSandboxMarkerTOGGLEWind  Auto  
{wind pillar marker - disable to put Skaal back to normal}

Book Property DLC2BlackBook01  Auto  

Faction Property PlayerFaction  Auto  

Faction Property DLC2SkaalFaction  Auto  
