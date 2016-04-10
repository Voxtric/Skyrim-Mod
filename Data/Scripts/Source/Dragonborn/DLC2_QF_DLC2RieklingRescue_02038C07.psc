;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC2_QF_DLC2RieklingRescue_02038C07 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Riekling1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Riekling3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Riekling3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DLC2RieklingRescueScript
Quest __temp = self as Quest
DLC2RieklingRescueScript kmyQuest = __temp as DLC2RieklingRescueScript
;END AUTOCAST
;BEGIN CODE
;DEBUG STAGE FOR TESTING PURPOSES ONLY
kmyquest.RollForRieklings()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
