;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC1_SF_DLC1VQ07FinalSceneAlt_0100D680 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().SetStage(135)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
debug.trace("vq07scenestarts")
MM.SlamToSerious()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
pSerana.GetActorRef().PlayIdleWithTarget(pPa_KillMoveDLC1SeranaHoldsVyrthur,pVyrthur.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Idle Property pPa_KillMoveDLC1SeranaHoldsVyrthur  Auto  

ReferenceAlias Property pSerana  Auto  

ReferenceAlias Property pVyrthur  Auto  

dlc1_NPCmentalmodelScript Property MM Auto
