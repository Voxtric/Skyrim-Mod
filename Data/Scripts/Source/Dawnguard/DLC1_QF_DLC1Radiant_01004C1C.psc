;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname DLC1_QF_DLC1Radiant_01004C1C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Sorine
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sorine Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CurrentQuestGiver
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CurrentQuestGiver Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TrollFollower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TrollFollower Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE dlc1radiantscript
Quest __temp = self as Quest
dlc1radiantscript kmyQuest = __temp as dlc1radiantscript
;END AUTOCAST
;BEGIN CODE
;debugging stage only

;start a hunterradiant quest
kmyquest.CreateQuestHunter()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE dlc1radiantscript
Quest __temp = self as Quest
dlc1radiantscript kmyQuest = __temp as dlc1radiantscript
;END AUTOCAST
;BEGIN CODE
;debugging stage only
;Harkon gives the player the gift

kmyquest.DLC1VampireTurn.ReceiveHarkonsGift(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE dlc1radiantscript
Quest __temp = self as Quest
dlc1radiantscript kmyQuest = __temp as dlc1radiantscript
;END AUTOCAST
;BEGIN CODE
;debugging stage only
;Harkon gives the player the gift

kmyquest.DLC1VampireTurn.ReceiveSeranasGift(None)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE dlc1radiantscript
Quest __temp = self as Quest
dlc1radiantscript kmyQuest = __temp as dlc1radiantscript
;END AUTOCAST
;BEGIN CODE
;debugging stage only
;player drinks from the chalice
debug.trace("DLC1Radiamt Stage 31")
kmyquest.ChaliceDrink()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE dlc1radiantscript
Quest __temp = self as Quest
dlc1radiantscript kmyQuest = __temp as dlc1radiantscript
;END AUTOCAST
;BEGIN CODE
;debugging stage only
;player increases the power of the chalice
debug.trace("DLC1Radiamt Stage 30")
kmyquest.ChalicePowerUp()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE dlc1radiantscript
Quest __temp = self as Quest
dlc1radiantscript kmyQuest = __temp as dlc1radiantscript
;END AUTOCAST
;BEGIN CODE
;debugging stage only
debug.trace("DLC1Radiamt Stage 20")
kmyquest.IntroQuestCompleted(isHunterQuest = true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE dlc1radiantscript
Quest __temp = self as Quest
dlc1radiantscript kmyQuest = __temp as dlc1radiantscript
;END AUTOCAST
;BEGIN CODE
;debugging stage only

;start a vampire radiant quest
kmyquest.CreateQuestVampire()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;debugging stage onlly
DLC1VampireTurn.PlayerBitesMe(TestVampireFeedActor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN AUTOCAST TYPE dlc1radiantscript
Quest __temp = self as Quest
dlc1radiantscript kmyQuest = __temp as dlc1radiantscript
;END AUTOCAST
;BEGIN CODE
;debugging stage only
debug.trace("DLC1Radiamt Stage 21")
kmyquest.IntroQuestCompleted(isVampireQuest = true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1VampireTurnScript Property DLC1VampireTurn  Auto  

Actor Property TestVampireFeedActor  Auto  
