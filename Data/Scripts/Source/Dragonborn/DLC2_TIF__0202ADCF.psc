;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_TIF__0202ADCF Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_2
Function Fragment_2(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDLC2RRGjalundInit.SetValue(1)
pDLC2DRRQS.SetSail(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC2DialogueRRQuestScript Property pDLC2DRRQS Auto
GlobalVariable Property pDLC2RRGjalundInit  Auto  
