;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC2_TIF__02024569 Extends TopicInfo Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akSpeakerRef)
Actor akSpeaker = akSpeakerRef as Actor
;BEGIN CODE
;make Ancarion attack the player
DLC2SV02ThalmorCrimeFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FavorDialogueScript Property DialogueFavorGeneric  Auto  

ReferenceAlias Property Alias_Ancarion  Auto  

Faction Property PlayerFaction  Auto  

Faction Property DLC2SV02ThalmorCrimeFaction  Auto  
