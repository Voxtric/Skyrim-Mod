;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_QF_DLC2AshSpawnAttack_02038423 Extends Quest Hidden

;BEGIN ALIAS PROPERTY WallGuard1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WallGuard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldPositionRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldPositionRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AshSpawn1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshSpawn1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WallGuard2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WallGuard2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AshSpawn2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshSpawn2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AshSpawn3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshSpawn3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DLC2AshSpawnAttackScript
Quest __temp = self as Quest
DLC2AshSpawnAttackScript kmyQuest = __temp as DLC2AshSpawnAttackScript
;END AUTOCAST
;BEGIN CODE
kmyquest.ResetAndActivateAshSpawn()

;set chance to happen from 100 to 25% -- see story manager conditions
kmyquest.DLC2AshSpawnAttackChance.setValue(25)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
