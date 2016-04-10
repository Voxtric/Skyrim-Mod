;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname DLC2_SF_DLC2MQ06MiraakKillDra_0202A908 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.Trace(self + ": Dragon Kill scene has ended")
(Miraak as DLC2MQ06MiraakBossBattle).DragonKillSceneEnded()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Miraak  Auto  
