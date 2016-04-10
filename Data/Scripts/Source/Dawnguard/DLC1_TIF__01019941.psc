;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC1_TIF__01019941 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DLC1HarkonChill.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DLC1HarkonTransforming.SetValue(1)
DLC1VampireTurn.NPCTransformIntoVampireLord(akSpeaker, RoyalOutfit = true, HarkonForceGreet = true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1VampireTurnScript Property DLC1VampireTurn  Auto

GlobalVariable Property DLC1HarkonTransforming  Auto  

GlobalVariable Property DLC1HarkonChill  Auto  
