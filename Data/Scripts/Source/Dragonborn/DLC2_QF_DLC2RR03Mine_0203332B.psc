;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_QF_DLC2RR03Mine_0203332B Extends Quest Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Elapsed Time Complete... do all the setup
;Quest never shuts down - contains dialogue topics for miners
pDLC2RRMine.SetValue(1)
pDLC2BloodskalBarrow01.Reset()
pDLC2RR03MineEnabler.Disable()
pDLC2MineOpenWorkerEnabler.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pDLC2RRMine  Auto  

ObjectReference Property pDLC2RR03MineEnabler  Auto  

ObjectReference Property pDLC2MineOpenWorkerEnabler  Auto  

Cell Property pDLC2BloodskalBarrow01  Auto  
