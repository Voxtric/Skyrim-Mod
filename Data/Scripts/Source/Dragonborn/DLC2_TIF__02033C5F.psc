;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_TIF__02033C5F Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; play sound effects
QSTGrotestTransformationVomit.Play(game.GetPlayer())
utility.wait(7)
QSTGrotestTransformationOneShot.Play(game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property QSTGrotestTransformationOneShot  Auto  

Sound Property QSTGrotestTransformationVomit  Auto  
