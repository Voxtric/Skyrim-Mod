;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC2_TIF__02024566 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
DialogueFavorGeneric.Persuade(akSpeaker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
Game.GetPlayer().AddItem(Alias_Map.GetReference())
;Alias_Ancarion.GetActorRef().RemoveItem(DLC2SV02Map)
GetOwningQuest().SetStage(30)
DLC2SV02ThalmorLeave.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FavorDialogueScript Property DialogueFavorGeneric  Auto  

Book Property DLC2SV02Map  Auto  

ReferenceAlias Property Alias_Ancarion  Auto  

GlobalVariable Property DLC2SV02ThalmorLeave  Auto  

ReferenceAlias Property Alias_Map  Auto  
