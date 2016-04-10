;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC2_QF_DLC2ExpSpiderQuest_02017962 Extends Quest Hidden

;BEGIN ALIAS PROPERTY SpiderControlledActor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderControlledActor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderSpawnControl01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderSpawnControl01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderControlledActor03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderControlledActor03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderSpawnControl02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderSpawnControl02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderSpawnControl03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderSpawnControl03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderSpawnControl04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderSpawnControl04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PackSpiderSpawnControl01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PackSpiderSpawnControl01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderControlledActor01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderControlledActor01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderSpawnControl05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderSpawnControl05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GlowSpiderSpawnControl01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GlowSpiderSpawnControl01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SpiderSpawnControl06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SpiderSpawnControl06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Merilar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Merilar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;DLC2ExpSpiderEnemyFaction.SetEnemy(PlayerFaction)
;debug.Trace("SPIDER QUEST SETTING FACTIONS!")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Starts scene if Merilar as you near her chamber
DLC2ExpSpiderQuestMerilarIntro.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC2ExpSpiderQuestMerilarIntro  Auto  
