;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_TIF__0001C5FC Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if pDLC1VQElderHandler.IsRunning() == 1
pDLC1VQElderHandlerGlob.SetValue(3)
pDLC1VQElderHandler.SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pDLC1VQElderHandlerGlob  Auto  

Quest Property pDLC1VQElderHandler  Auto  
