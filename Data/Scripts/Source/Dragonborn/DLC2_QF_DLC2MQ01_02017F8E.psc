;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 21
Scriptname DLC2_QF_DLC2MQ01_02017F8E Extends Quest Hidden

;BEGIN ALIAS PROPERTY TempleMapMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TempleMapMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2MQ01MiraakTalkingMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2MQ01MiraakTalkingMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ01PillarMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ01PillarMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Stage20Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Stage20Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WizardAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WizardAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Villager2Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Villager2Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ01Miraak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ01Miraak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SearchCultistAmbushObjective
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SearchCultistAmbushObjective Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Villager1Alias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Villager1Alias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RavenRockMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RavenRockMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GjalundAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GjalundAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
SetObjectiveCompleted(5)
SetObjectiveDisplayed(7)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;player has read note from cultists

if Game.GetPlayer().GetCurrentLocation() == DLC2SolstheimLocation
SetObjectiveCompleted(5)
SetObjectiveCompleted(7)
;SetStage(20)
else
; otherwise, give objective 10
setObjectiveCompleted(5)
SetObjectiveCompleted(7)
;SetObjectiveDisplayed(10)
endif
;move Neloth to Raven Rock
Alias_WizardAlias.GetReference().MoveTo(DLC2MQ01NelothMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; player is pointed to pillar
;SetObjectiveCompleted(10)
;SetObjectiveCompleted(20)
;SetObjectiveDisplayed(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start up, triggered by absorbing dragon soul when not in combat

;lock player's controls but allow looking and camera switch
;Game.DisablePlayerControls(true, true, false, false, true, true, true, true)

;DLC2MiraakScript Miraak = Alias_MQ01Miraak.GetActorReference() as DLC2MiraakScript 
;Miraak.Appear()

;Alias_DLC2MQ01MiraakTalkingMarker.GetReference().MoveTo(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
CompleteAllObjectives()
DLC2CultistOrdersQuestObjectHandlerNote.Clear()

DLC2MQ02.SetStage(10)


Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;player is directed to temple
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveCompleted(25)
SetObjectiveDisplayed(30)
Alias_TempleMapMarker.GetReference().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player has arrived on Solstheim
SetObjectiveCompleted(10)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; player encountered cultists on Solstheim
SetStage(10)
; since player is on Solstheim, give objective 20
SetObjectiveDisplayed(20)
DLC2MQ02FreaTempleSceneQuest.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
SetObjectiveDisplayed(5)

;Start Temple scene, which enables Frea and allows player to skip straight to the end
DLC2MQ02FreaTempleSceneQuest.Start()

SetActive(true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property VisionScene  Auto  

Quest Property DLC2MQ02  Auto  

ObjectReference Property MiraakTempleMarker  Auto  

ObjectReference Property DLC2MQ01NelothMarker  Auto  

Quest Property DLC2MQ02FreaTempleSceneQuest  Auto  

WorldSpace Property DLC2SolstheimWorldspace  Auto  

Location Property DLC2SolstheimLocation  Auto  

ReferenceAlias Property DLC2CultistOrdersQuestObjectHandlerNote  Auto  
