;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC1_QF_DLC1EclipseAttack4_0101764A Extends Quest Hidden

;BEGIN ALIAS PROPERTY Habitation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Habitation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WEMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WEMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY EdgeMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EdgeMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Attacker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Attacker2 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
debug.trace(self + "stage 255, calling DeleteWhenAble() on created aliases")
Alias_Attacker1.GetReference().DeleteWhenAble()
Alias_Attacker2.GetReference().DeleteWhenAble()
Alias_Attacker3.GetReference().DeleteWhenAble()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DLC1EclipseAttackScript
Quest __temp = self as Quest
DLC1EclipseAttackScript kmyQuest = __temp as DLC1EclipseAttackScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "stage 1")
kmyquest.MoveAndEnableAttackersToFathestSpawnPointAlias()

kmyquest.SetControllingGlobals()

kmyquest.DLC1EclipseAttackGuardHellos.SetValue(1) ; turn on guard hellos
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
