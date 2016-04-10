;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname DLC1_QF_DLC1VQCastleGuard_0101A415 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Guard
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Guard Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Shutdown stage, set when the MiscObjective quest starts
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;The guard sees Serana and does a brief scene to open the gate
DLC1VQCastleGuardOpenGate.Start()
;castlecontroller.setgateopen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;At this stage, the guard will stand by the gate, force-greeting the player to warn him away
castlecontroller.setgateclosed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
castlecontroller.setgateopen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;The player has rejected Harkon's offer to become a vampire. Disable the gaurd and close the gate

;Disable the guard and close the gate
DLC1VampireCastleGuardRef.Disable()
castlecontroller.setgateclosed()

;Shut down this quest
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DA08  Auto  
DLC1VampireCastleControllerScript Property CastleController auto

ObjectReference Property DLC1VampireCastleGuardRef  Auto  

Scene Property DLC1VQCastleGuardOpenGate  Auto  
