;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_PF_DLC2RR02TilisuTombMov_0201F311 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
pDLC2RR02TilisuMove.SetValue(1)
pTilisu.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pDLC2RR02TilisuMove  Auto  

ReferenceAlias Property pTilisu  Auto  
