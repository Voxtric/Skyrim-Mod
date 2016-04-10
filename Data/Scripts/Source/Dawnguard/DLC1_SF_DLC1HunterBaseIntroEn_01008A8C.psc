;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname DLC1_SF_DLC1HunterBaseIntroEn_01008A8C Extends Scene Hidden

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
DLC1DawnguardLightBeamRef.SetAnimationVariableFloat("ftoggleblend", 0)
Utility.Wait(0.5)
DLC1DawnguardLightBeamLightRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DLC1DawnguardGateRef1.SetOpen(true)
DLC1DawnguardGateRef2.SetOpen(true)
DLC1DawnguardGateRef3.SetOpen(true)
GetOwningQuest().SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
DLC1DawnguardLightBeamRef.SetAnimationVariableFloat("ftoggleblend", 0)
Utility.Wait(0.5)
DLC1DawnguardLightBeamLightRef.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
DLC1DawnGuardLightBeamRef.SetAnimationVariableFloat("ftoggleblend", 1)
Utility.Wait(0.5)
DLC1DawnguardLightBeamLightRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
DLC1DawnguardGateRef1.SetOpen(false)
DLC1DawnguardGateRef2.SetOpen(false)
DLC1DawnguardGateRef3.SetOpen(false)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC1DawnguardLightBeamRef  Auto  

ObjectReference Property DLC1DawnguardLightBeamLightRef  Auto  

ObjectReference Property DLC1DawnguardGateRef1  Auto  

ObjectReference Property DLC1DawnguardGateRef2  Auto  

ObjectReference Property DLC1DawnguardGateRef3  Auto  

Keyword Property Vampire  Auto  

