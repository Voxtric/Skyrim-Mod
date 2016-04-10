;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname DLC1_QF_DLC1VQ00_0100D90E Extends Quest Hidden

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Messenger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Messenger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; player has spoken to the messenger
; give objective only if misc objective to Fort Dawnguard not already active
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; called if Durak is killed
SetObjectiveFailed(10)
; quest needs to stay running so player can get guard rumor
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; Durak gives player a crossbow
DLC1VQ01MiscObjective.SetStage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; move the messenger back to his editor location when done
; FOR NOW - let him walk and see how that works
;Alias_Messenger.GetRef().MoveToMyEditorLocation()
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; player gets initial objective to Fort Dawnguard
SetObjectiveCompleted(10)
DLC1VQ01MiscObjective.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; if player isn't in Dawnguard location, set stage 30 for dialogue conditions
SetStage(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
; stage 30 is set if player was not in Dawnguard location when stage 50 was set
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC1VQ01MiscObjective  Auto  
