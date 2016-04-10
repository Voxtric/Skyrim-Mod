;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC1_TIF__01006535 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
dlc1vq02harkongreet.setvalue(1)
GetOwningQuest().SetStage(20)
DLC1HarkonTransforming.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;DLC1VampireTurn.NPCTransformIntoVampireLord(akSpeaker, RoyalOutfit = true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC1VQ02HarkonGreet  Auto  

GlobalVariable Property DLC1HarkonTransforming  Auto  
