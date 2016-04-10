;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC1_QF_DLC1Surgery_0100697C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Surgeon
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Surgeon Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; player knows exact location
SetObjectiveDisplayed(10, false) ; hide this objective if it existed
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN AUTOCAST TYPE DLC1SurgeryScript
Quest __temp = self as Quest
DLC1SurgeryScript kmyQuest = __temp as DLC1SurgeryScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
