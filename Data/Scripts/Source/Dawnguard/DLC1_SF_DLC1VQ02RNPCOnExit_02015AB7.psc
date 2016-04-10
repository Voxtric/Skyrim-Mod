;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_SF_DLC1VQ02RNPCOnExit_02015AB7 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; stop ignoring friendly hits - we're out of Dimhollow
RNPC.GetActorRef().IgnoreFriendlyHits(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
DLC1_NPCMentalModelScript Property MM Auto

ReferenceAlias Property RNPC  Auto  
