;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC1_SF_DLC1VampireBaseIntroS_01005E36 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
StalfAlias.GetReference().MoveTo(EnemyIntroMarker)
SaloniaAlias.GetReference().MoveTo(EnemyIntroMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
getowningquest().setstage(40)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property StalfMarker  Auto  

ObjectReference Property SaloniaMarker  Auto  

ReferenceAlias Property StalfAlias  Auto  

ReferenceAlias Property SaloniaAlias  Auto  

ObjectReference Property EnemyIntroMarker  Auto  
