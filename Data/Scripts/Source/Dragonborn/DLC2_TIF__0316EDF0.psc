;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_TIF__0316EDF0 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;Game.GetPlayer().AddItem(DLC2Scathecraw01, 5)
;Game.GetPlayer().AddItem(DLC2TramaRoot01, 5)
;Game.GetPlayer().AddItem(DLC2HangingMoss, 5)
GetOwningQuest().SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Ingredient Property DLC2HangingMoss  Auto  

Ingredient Property DLC2TramaRoot01  Auto  

Ingredient Property DLC2Scathecraw01  Auto  
