;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC1_QF_DLC1_NPCMentalModel_01002B6E Extends Quest Hidden

;BEGIN ALIAS PROPERTY ResponsiveNPC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ResponsiveNPC Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ResponsiveNPC_Essential
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ResponsiveNPC_Essential Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ResponsiveNPCVampireKeywords
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ResponsiveNPCVampireKeywords Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HomeMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HomeMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE dlc1_npcmentalmodelscript
Quest __temp = self as Quest
dlc1_npcmentalmodelscript kmyQuest = __temp as dlc1_npcmentalmodelscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.Setup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE dlc1_npcmentalmodelscript
Quest __temp = self as Quest
dlc1_npcmentalmodelscript kmyQuest = __temp as dlc1_npcmentalmodelscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.DumpHistory()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE dlc1_npcmentalmodelscript
Quest __temp = self as Quest
dlc1_npcmentalmodelscript kmyQuest = __temp as dlc1_npcmentalmodelscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.EngageFollowBehavior()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
