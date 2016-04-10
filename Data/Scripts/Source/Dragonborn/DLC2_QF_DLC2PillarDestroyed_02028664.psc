;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC2_QF_DLC2PillarDestroyed_02028664 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Spectator14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Monster
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Monster Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator19
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator19 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator18
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator18 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator11 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PillarShoutTrigger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PillarShoutTrigger Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator20
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator20 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Spectator3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Spectator3 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DLC2PillarDestroyedSpectatorsScript
Quest __temp = self as Quest
DLC2PillarDestroyedSpectatorsScript kmyQuest = __temp as DLC2PillarDestroyedSpectatorsScript
;END AUTOCAST
;BEGIN CODE
; debug.trace("DLC2PillarDestroyed startup Stage 0")

; debug.trace("DLC2PillarDestroyed RemoveAliasesFromBuilderFaction()")
kmyquest.RemoveAliasesFromBuilderFaction()

; debug.trace("DLC2PillarDestroyed RegisterForSingleUpdateGameTime()")
RegisterForSingleUpdateGameTime(0.5) ;stops quest

; debug.trace("DLC2PillarDestroyed DONE WITH STAGE 0")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
