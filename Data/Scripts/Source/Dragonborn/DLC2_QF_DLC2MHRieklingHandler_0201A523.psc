;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_QF_DLC2MHRieklingHandler_0201A523 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Riekling004
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling004 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thirsk
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Thirsk Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling011
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling011 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling013
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling013 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling016
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling016 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling017
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling017 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling019
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling019 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling001 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling012
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling012 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling014
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling014 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling018
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling018 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling007
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling007 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling009
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling009 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling008
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling008 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling006
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling006 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling005
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling005 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling003
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling003 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling002
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling002 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling010
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling010 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling020
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling020 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling015
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling015 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY spawnPoint
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_spawnPoint Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DLC2MHRieklingHandlerQuestScript
Quest __temp = self as Quest
DLC2MHRieklingHandlerQuestScript kmyQuest = __temp as DLC2MHRieklingHandlerQuestScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ProcessFoundRieklings()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
