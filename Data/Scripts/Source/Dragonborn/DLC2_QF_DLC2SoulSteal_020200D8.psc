;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC2_QF_DLC2SoulSteal_020200D8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY dragon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_dragon Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiraakSpawnMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiraakSpawnMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Miraak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Miraak Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DLC2SoulStealScript
Quest __temp = self as Quest
DLC2SoulStealScript kmyQuest = __temp as DLC2SoulStealScript
;END AUTOCAST
;BEGIN CODE
;TEST DEBUGGING STAGE ONLY
kmyquest.MiraakAppears(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN AUTOCAST TYPE DLC2SoulStealScript
Quest __temp = self as Quest
DLC2SoulStealScript kmyQuest = __temp as DLC2SoulStealScript
;END AUTOCAST
;BEGIN CODE
;TEST DEBUGGING STAGE ONLY
kmyquest.MiraakDisappears()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
