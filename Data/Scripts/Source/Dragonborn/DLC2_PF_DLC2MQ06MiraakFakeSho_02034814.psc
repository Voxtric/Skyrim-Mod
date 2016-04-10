;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_PF_DLC2MQ06MiraakFakeSho_02034814 Extends Package Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(Actor akActor)
;BEGIN CODE
; debug.Trace(self + ": Dragon Kill scene has ended")
(Miraak as DLC2MQ06MiraakBossBattle).DragonKillSceneEnded()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Miraak  Auto  
