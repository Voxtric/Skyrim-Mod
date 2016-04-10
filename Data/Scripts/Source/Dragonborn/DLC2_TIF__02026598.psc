;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC2_TIF__02026598 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
; remove book from Frea
akSpeaker.RemoveItem(DLC2BlackBook02, 99)
; give book to player
GetOwningQuest().SetStage(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Book Property DLC2BlackBook02  Auto  

ReferenceAlias Property BlackBook02Alias  Auto  
