;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_TIF__02034F82 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().RemoveItem(Gold001, 1)
akspeaker.additem(gold001, 1)
FavorJobsBeggarsAbility.Cast(Game.GetPlayer(), Game.GetPlayer())
FavorJobsBeggarMessage.Show()

If akspeaker.GetRelationshipRank(Game.GetPlayer()) == 0
  akspeaker.SetRelationshipRank(Game.GetPlayer(), 1)
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property FavorJobsBeggarsAbility  Auto  

Message Property FavorJobsBeggarMessage  Auto  

MiscObject Property Gold001  Auto  
