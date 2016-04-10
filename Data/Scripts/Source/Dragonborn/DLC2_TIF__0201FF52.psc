;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_TIF__0201FF52 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if GetOwningQuest().GetStage() == 60
GetOwningQuest().SetObjectiveCompleted(20)
GetOwningQuest().SetObjectiveDisplayed(60)
elseif GetOwningQuest().GetStage() == 50
GetOwningQuest().SetObjectiveCompleted(20)
GetOwningQuest().SetObjectiveDisplayed(50,1)
else
GetOwningQuest().SetStage(30)
endif
(GetOwningQuest() as DLC2MQ03QuestScript).StornStoneTalk=1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
