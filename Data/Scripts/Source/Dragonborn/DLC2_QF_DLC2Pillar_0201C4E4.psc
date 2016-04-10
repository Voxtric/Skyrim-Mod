;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname DLC2_QF_DLC2Pillar_0201C4E4 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Builder2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Builder2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Builder3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Builder3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiraakVoiceMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiraakVoiceMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Builder7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Builder7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Builder10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Builder10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Builder8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Builder8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TestAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TestAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Builder9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Builder9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Builder1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Builder1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Builder5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Builder5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Builder6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Builder6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Builder4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Builder4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FollowerAtPillar
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FollowerAtPillar Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
RegisterForSleep()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DLC2PillarScript
Quest __temp = self as Quest
DLC2PillarScript kmyQuest = __temp as DLC2PillarScript
;END AUTOCAST
;BEGIN CODE
;debug stage only

kmyquest.MakeMeABuilder(Alias_TestAlias.GetActorReference(), 4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; do once - run Neloth scene after first time player touches pillar
DLC2PillarNelothReaction.Start()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property DLC2PillarNelothReaction  Auto  
