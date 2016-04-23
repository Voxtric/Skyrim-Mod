;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname TIF__0200CC30 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
GetOwningQuest().SetStage(102)
Auxentius.AddItem((Artifact As ReferenceAlias).GetRef())
Game.GetPlayer().AddItem(Gold001, 1000)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Actor Property Auxentius  Auto

Alias Property Artifact  Auto  

MiscObject Property Gold001  Auto  
