;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC2_SF_DLC2TameDragonScene1_02017EB8 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace(self + " START SCENE")
; check for valid worldspace
(GetOwningQuest() as DLC2TameDragonScript).ValidateWorldspace()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; debug.trace(self + " PHASE 2 END")
; restrain dragon now that he's landed
(GetOwningQuest() as DLC2TameDragonScript).RestrainDragon(true)
; check for valid worldspace
(GetOwningQuest() as DLC2TameDragonScript).ValidateWorldspace()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; debug.trace(self + " END SCENE")
(GetOwningQuest() as DLC2TameDragonScript).EndWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; debug.trace(self + " PHASE 1 END")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
