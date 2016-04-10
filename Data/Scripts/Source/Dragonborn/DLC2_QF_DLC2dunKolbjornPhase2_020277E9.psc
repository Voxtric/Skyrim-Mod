;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname DLC2_QF_DLC2dunKolbjornPhase2_020277E9 Extends Quest Hidden

;BEGIN ALIAS PROPERTY KolbjornEnemy16
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy16 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy6
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy6 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy13
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy13 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy8
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy8 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy15
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy15 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2KolbjornBarrow
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC2KolbjornBarrow Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy9
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy9 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy17
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy17 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy7
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy7 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy4
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy4 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy14
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy14 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy5
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy5 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy12
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy12 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KolbjornEnemy11
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KolbjornEnemy11 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player has killed all enemies. Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has killed all but five enemies.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Nothing to do here.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2dunKolbjornQST  Auto  
