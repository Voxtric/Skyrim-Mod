;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC1_SF_DLC1LD_D2_KatriaIntro_01004D72 Extends Scene Hidden

ReferenceAlias property Katria Auto

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
Debug.Trace("Intro done.")
if (!GetOwningQuest().GetStageDone(22))
     GetOwningQuest().setStage(21)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
Debug.Trace("Intro started.")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
