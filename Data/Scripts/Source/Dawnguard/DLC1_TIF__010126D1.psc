;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_TIF__010126D1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDLC1VQElderHandlerGlob.SetValue(2)
pDLC1VQElderScrollCoin.SetValue(4)
pDLC1VQElderHandler.SetStage(200)
GetOwningQuest().SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pDLC1VQElderScrollCoin  Auto  

Quest Property pDLC1VQElderHandler  Auto  

GlobalVariable Property pDLC1VQElderHandlerGlob  Auto  
