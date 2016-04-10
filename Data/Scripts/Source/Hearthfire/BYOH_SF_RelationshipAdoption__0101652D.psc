;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname BYOH_SF_RelationshipAdoption__0101652D Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Child1.GetActorRef().SetAV("Variable07", 0)
(GetOwningQuest() as BYOHRelationshipAdoptionScript).OrderToConfirm = 1.3
(GetOwningQuest() as BYOHRelationshipAdoptionScript).IssueOrderWithDuration(Child1.GetActorRef(), 1)
Child1.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
Child1.GetActorRef().SetAV("Variable07", 0)
Child2.GetActorRef().SetAV("Variable07", 0)
(GetOwningQuest() as BYOHRelationshipAdoptionScript).UnblockGames(Child1.GetActorRef())
(GetOwningQuest() as BYOHRelationshipAdoptionScript).UnblockGames(Child2.GetActorRef())
(GetOwningQuest() as BYOHRelationshipAdoptionScript).ForcegreetEventReady = False
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Child1  Auto  

ReferenceAlias Property Child2  Auto  
