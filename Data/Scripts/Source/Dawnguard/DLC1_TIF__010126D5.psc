;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_TIF__010126D5 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDLC1VQElderHandlerGlob.SetValue(2)
pFDS.Persuade(akSpeaker)
pDLC1VQElderScrollCoin.SetValue(3)
pDLC1VQElderHandler.SetStage(200)
GetOwningQuest().SetStage(25)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FavorDialogueScript Property pFDS  Auto  

GlobalVariable Property pDLC1VQElderScrollCoin  Auto  

Quest Property pDLC1VQElderHandler  Auto  

GlobalVariable Property pDLC1VQElderHandlerGlob  Auto  
