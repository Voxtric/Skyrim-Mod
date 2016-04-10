;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BYOH_TIF__01003DC1 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Gold001, 25)
akSpeaker.AddItem(Gold001, 25)
(GetOwningQuest() as BYOHRelationshipAdoptionScript).DecrementPoorCount(1)
FavorJobsBeggarsAbility.Cast(Game.GetPlayer(), Game.GetPlayer())
FavorJobsBeggarMessage.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property RelationshipAdoption  Auto  

MiscObject Property Gold001  Auto  

Message Property FavorJobsBeggarMessage  Auto  

SPELL Property FavorJobsBeggarsAbility  Auto  
