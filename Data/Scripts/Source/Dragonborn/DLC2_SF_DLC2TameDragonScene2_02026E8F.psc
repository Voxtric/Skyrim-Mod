;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC2_SF_DLC2TameDragonScene2_02026E8F Extends Scene Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; check for valid worldspace
(GetOwningQuest() as DLC2TameDragonScript).ValidateWorldspace()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; check for valid worldspace
(GetOwningQuest() as DLC2TameDragonScript).ValidateWorldspace()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; debug.trace(self + " END SCENE")
(GetOwningQuest() as DLC2TameDragonScript).EndWait()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
