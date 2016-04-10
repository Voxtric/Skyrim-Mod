;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_TIF__01018B1C Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().AddItem(DLC1ArmorDawnguardBody1, 1)
Game.GetPlayer().AddItem(DLC1ArmorDawnguardBoots, 1)
Game.GetPlayer().AddItem(DLC1ArmorDawnguardGloves, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property DLC1ArmorDawnguardBody1  Auto  

Armor Property DLC1ArmorDawnguardBoots  Auto  

Armor Property DLC1ArmorDawnguardGloves  Auto  
