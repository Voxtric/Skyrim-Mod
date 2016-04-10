;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC1_QF_DLC2MQ01_02017F8E Extends Quest Hidden

;BEGIN ALIAS PROPERTY MQ01Miraak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ01Miraak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Stage20Trigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Stage20Trigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GjalundAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GjalundAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MQ01PillarMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MQ01PillarMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start up, triggered by change location


;lock player's controls but allow looking and camera switch
Game.DisablePlayerControls(true, true, false, false, true, true, true, true)

;Move Miraak to player
Alias_MQ01Miraak.GetReference().MoveTo(Game.GetPlayer(), 200)

;Enable Miraak
Alias_MQ01Miraak.GetReference().Enable(true)

;Start Scene
VisionScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;player has had vision of Miraak

;Disable Miraak
Alias_MQ01Miraak.GetReference().Disable(true)

;unlock player controls
Game.EnablePlayerControls()

;update objective
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;player is directed to top of pillar
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;player has arrived on Solstheim
SetObjectiveCompleted(10,1)
SetObjectiveDisplayed(20,1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property VisionScene  Auto  
