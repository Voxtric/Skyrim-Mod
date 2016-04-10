;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname DLC1_QF_DLC1VampireFeedBystan_02014CB9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Bystander8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY victim
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_victim Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bystander6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bystander6 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE DLC1VampireFeedBystanderScript
Quest __temp = self as Quest
DLC1VampireFeedBystanderScript kmyQuest = __temp as DLC1VampireFeedBystanderScript
;END AUTOCAST
;BEGIN CODE
debug.trace("DLC1VampireFeedBystander startup stage 1, will call CheckBystandersSendAlarmAndStopQuest()")
kmyquest.CheckBystandersSendAlarmAndStopQuest()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


