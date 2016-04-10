;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname BYOH_TIF__01004D07 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
game.getplayer().removeitem(gold, HDRiftenChildRoom.value as int)
(GetOwningQuest() as BYOHRelationshipAdoptionHousePurchase).Riften_EnableChildBedroom()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
ObjectReference Property DecorateMarker  Auto  

MiscObject Property Gold  Auto  

int Property GoldAmount  Auto  

GlobalVariable Property HDRiftenChildRoom  Auto  
