;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_TIF__02038559 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
pDLC2HirelingRecognizeTeldryn.SetValue(1)
pDLC2HirelingQuestScript.PayHireling(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC2HirelingQuestScript Property pDLC2HirelingQuestScript  Auto  

GlobalVariable Property pDLC2HirelingRecognizeTeldryn  Auto  

DialogueFollowerScript Property DialogueFollowerQScript  Auto  
