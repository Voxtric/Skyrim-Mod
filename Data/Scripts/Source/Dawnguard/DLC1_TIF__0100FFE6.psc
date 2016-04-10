;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_TIF__0100FFE6 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as DLC1VQ03RNPCQuestScript).MadeInnuendoChoice = true
if (((self as Form) as DLC1DoOnce).DoOnce())
    (GetOwningQuest() as DLC1VQ03RNPCQuestScript).MM.IncreaseOpen()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
