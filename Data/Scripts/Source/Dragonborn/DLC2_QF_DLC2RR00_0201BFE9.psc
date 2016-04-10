;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_QF_DLC2RR00_0201BFE9 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Quick debug to complete DLC2RR01 and DLC2RR03
pDLC2RR01.SetStage(200)
pDLC2RR03.SetStage(200)
SetStage(10)
Utility.Wait(3)
pDLC2ModynRef.MoveTo(pDLC2RR02VelethCenterMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;This fires off DLC2RR02 which is waiting for RR01 and RR03 to be done
pDLC2RR02.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDLC2RR02  Auto  

Quest Property pDLC2RR01  Auto  

Quest Property pDLC2RR03  Auto  

ObjectReference Property pDLC2RR02VelethCenterMarker  Auto  

ObjectReference Property pDLC2ModynRef  Auto  
