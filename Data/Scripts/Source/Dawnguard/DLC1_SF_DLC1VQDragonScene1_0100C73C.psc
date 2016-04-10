;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname DLC1_SF_DLC1VQDragonScene1_0100C73C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
debug.trace(self + " END SCENE")
(GetOwningQuest() as DLC1VQDragonScript).TeachWordToPlayer() ; failsafe
(GetOwningQuest() as DLC1VQDragonScript).EndSummonWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
debug.trace(self + " Phase 1 done - dragon has loaded3D")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
debug.trace(self + " Phase 4 done")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
debug.trace(self + " START SCENE")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
debug.trace(self + " Phase 2 done")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
debug.trace(self + " Phase 3 done")
(GetOwningQuest() as DLC1VQDragonScript).TeachWordToPlayer()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property dragon  Auto  
