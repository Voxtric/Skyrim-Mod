;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC1_TIF__02004A3D Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
if (MarriageQuest.IsRunning())
     if (Spouse.GetActorRef().GetActorBase().GetSex() == 0)
          (GetOwningQuest() as DLC1_NPCMentalModelScript).SpouseIsMale = true
     else
          (GetOwningQuest() as DLC1_NPCMentalModelScript).SpouseIsMale = false
     endif
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Spouse  Auto  

Quest Property MarriageQuest  Auto  
