;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC2_QF_DLC2ThirskRieklingSpa_020208CC Extends Quest Hidden

;BEGIN ALIAS PROPERTY Riekling02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Thirsk
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Thirsk Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DLC2ThirskRieklingSpawnerScript
Quest __temp = self as Quest
DLC2ThirskRieklingSpawnerScript kmyQuest = __temp as DLC2ThirskRieklingSpawnerScript
;END AUTOCAST
;BEGIN CODE
kmyQuest.ProcessRieklings()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
