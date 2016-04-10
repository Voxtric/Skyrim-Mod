;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BYOH_TIF__01003E67 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
(GetOwningQuest() as BYOHRelationshipAdoptionScript).FGReceiveGift(akSpeaker)
(GetOwningQuest() as BYOHRelationshipAdoptionScript).ForcegreetEventReady = False
akSpeaker.SetAV("Variable07", 0)
akSpeaker.EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RelationshipAdoption  Auto  
