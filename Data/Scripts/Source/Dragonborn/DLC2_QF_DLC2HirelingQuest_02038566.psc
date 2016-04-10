;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_QF_DLC2HirelingQuest_02038566 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2FollowerAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2FollowerAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DLC2HirelingQuestScript
Quest __temp = self as Quest
DLC2HirelingQuestScript kmyQuest = __temp as DLC2HirelingQuestScript
;END AUTOCAST
;BEGIN CODE
;Reset system for the follower idle
kmyquest.Commented()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
