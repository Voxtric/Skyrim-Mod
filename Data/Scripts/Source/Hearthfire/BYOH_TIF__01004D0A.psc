;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BYOH_TIF__01004D0A Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getplayer().removeitem(gold, HDMarkarthAlchemy.value as int)
(GetOwningQuest() as BYOHRelationshipAdoptionHousePurchase).Markarth_EnableChildBedroomAlternative()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

int Property GoldAmount  Auto  

MiscObject Property Gold  Auto  

ObjectReference Property DecorateMarker  Auto  

GlobalVariable Property HDMarkarthAlchemy  Auto  
