;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_SF_DLC1VQ08HarkonBattleS_0100D64F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Harkon.GetActorRef().SetAV("Variable09", Harkon.GetActorRef().GetAV("Variable09") + 1)
Debug.Trace("Scene increments Variable09. Now: " + Harkon.GetActorRef().GetAV("Variable09"))
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Harkon  Auto  
