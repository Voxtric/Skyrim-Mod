;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC2_QF_DLC2dunGyldenhulQST_0201A374 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
DLC2dunHaknirRef.Enable()
DLC2dunHaknirRotatingDoor.Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
DLC2dunHaknirRotatingDoor.Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC2dunHaknirRef  Auto  

ObjectReference Property DLC2dunHaknirRotatingDoor  Auto  
