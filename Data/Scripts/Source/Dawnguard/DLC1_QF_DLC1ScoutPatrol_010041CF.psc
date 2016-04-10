;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC1_QF_DLC1ScoutPatrol_010041CF Extends Quest Hidden

;BEGIN ALIAS PROPERTY ScoutVampire2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ScoutVampire2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ScoutMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ScoutMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ScoutVampire1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ScoutVampire1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ScoutMarker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ScoutMarker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scout1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scout1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ScoutHunter1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ScoutHunter1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ScoutHunter2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ScoutHunter2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Scout2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Scout2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
debug.trace("DLC1ScoutPatrol Stage 0")
DLC1ScoutPatrolChance.SetValue(25)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
debug.trace("DLC1ScoutPatrol Stage 255")
Alias_Scout1.GetActorReference().DeleteWhenAble()
Alias_Scout2.GetActorReference().DeleteWhenAble()
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC1ScoutPatrolChance  Auto  
