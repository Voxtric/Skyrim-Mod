;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_TIF__01014F00 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if (GetOwningQuest().GetStageDone(141) && !GetOwningQuest().GetStageDone(142))
      GetOwningQuest().SetStage(142)
ElseIf (GetOwningQuest().GetStageDone(144) && !GetOwningQuest().GetStageDone(145))
      GetOwningQuest().SetStage(145)
ElseIf (GetOwningQuest().GetStageDone(147) && !GetOwningQuest().GetStageDone(148))
      GetOwningQuest().SetStage(148)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
