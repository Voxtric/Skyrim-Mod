;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_TIF__02038B47 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; don't dismiss the follower again if I've already dismissed them
If !(akspeaker.IsInFaction(DismissedFollowerFaction))
  DialogueFollower.DismissFollower(0, 0)
EndIf
DLC2HirelingQuest.DismissNewFollower()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DismissedFollowerFaction  Auto  

DialogueFollowerScript Property DialogueFollower  Auto  

DLC2HirelingQuestScript Property DLC2HirelingQuest  Auto  

Alias Property FollowerAlias  Auto  
