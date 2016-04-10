;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname BYOH_SF_RelationshipAdoption__0101652E Extends Scene Hidden

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
Child1.GetActorRef().SetAV("Variable07", 0)
Child2.GetActorRef().SetAV("Variable07", 0)
(GetOwningQuest() as BYOHRelationshipAdoptionScript).UnblockGames(Child1.GetActorRef())
(GetOwningQuest() as BYOHRelationshipAdoptionScript).UnblockGames(Child2.GetActorRef())
(GetOwningQuest() as BYOHRelationshipAdoptionScript).ForcegreetEventReady = False
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Debug.Trace("Starting Tag Game")
(GetOwningQuest() as BYOHRelationshipAdoptionScript).UnblockGames(Child1.GetActorRef())
(GetOwningQuest() as BYOHRelationshipAdoptionScript).UnblockGames(Child2.GetActorRef())
WIGamesTagStart.SendStoryEvent(Child1.GetReference().GetCurrentLocation(), Child1.GetReference(), Child2.GetReference())
Child1.GetActorRef().EvaluatePackage()
Child2.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
Child1.GetActorRef().EvaluatePackage()
Child2.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property WIGamesTagStart  Auto  

ReferenceAlias Property Child1  Auto  

ReferenceAlias Property Child2  Auto  
