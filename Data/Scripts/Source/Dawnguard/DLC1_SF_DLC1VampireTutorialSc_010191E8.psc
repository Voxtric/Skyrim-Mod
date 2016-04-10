;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC1_SF_DLC1VampireTutorialSc_010191E8 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
GetOwningQuest().SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; keep the player in lord form

(DLC1PlayerVampireQuest as DLC1PlayerVampireChangeScript).Untimed = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; keep the player in lord form

(DLC1PlayerVampireQuest as DLC1PlayerVampireChangeScript).Untimed = false
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC1PlayerVampireQuest  Auto  
