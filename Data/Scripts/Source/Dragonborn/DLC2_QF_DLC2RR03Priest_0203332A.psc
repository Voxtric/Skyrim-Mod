;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC2_QF_DLC2RR03Priest_0203332A Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RR03BloodskalLocAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC2RR03BloodskalLocAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RR03Priest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RR03Priest Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;If the seeker in Bloodskal is still alive when Player leaves the dungeon, pop this miniquest
SetObjectiveDisplayed(10,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Seeker dead
SetObjectiveCompleted(10,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
