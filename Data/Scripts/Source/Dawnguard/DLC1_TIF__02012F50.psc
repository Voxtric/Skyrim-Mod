;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_TIF__02012F50 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(DLC1ElderScrollBlood,1)
Game.GetPlayer().RemoveItem(DLC1ElderScrollSun,1)
Game.GetPlayer().AddItem(Gold001,6000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property DLC1ElderScrollBlood  Auto  

Book Property DLC1ElderScrollSun  Auto  

MiscObject Property Gold001  Auto  
