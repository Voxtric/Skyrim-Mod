;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC1_QF_DLC1HunterBaseIntroAm_01002B01 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
ObjectReference Vampire1 = DLC1HunterBaseIntroAmbushMarker1.PlaceAtMe(LvlVampire,1)
ObjectReference Vampire2 = DLC1HunterBaseIntroAmbushMarker2.PlaceAtMe(LvlVampire,1)
ObjectReference Vampire3 = DLC1HunterBaseIntroAmbushMarker3.PlaceAtMe(LvlVampireBoss,1)
AmbushCreature1.ForceRefTo(Vampire1)
AmbushCreature2.ForceRefTo(Vampire2)
AmbushCreature3.ForceRefTo(Vampire3)
AmbushCreature1.GetActorReference().EvaluatePackage()
AmbushCreature2.GetActorReference().EvaluatePackage()
AmbushCreature3.GetActorReference().EvaluatePackage()
(DLC1HunterBaseIntro as DLC1HunterBaseIntroQuestScript).AmbushRun=1
SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC1HunterBaseIntro  Auto  

ObjectReference Property DLC1HunterBaseIntroAmbushMarker1  Auto  

ObjectReference Property DLC1HunterBaseIntroAmbushMarker2  Auto  

ObjectReference Property DLC1HunterBaseIntroAmbushMarker3  Auto  


ActorBase Property LvlVampire  Auto  

ActorBase Property LvlVampireBoss  Auto  

ReferenceAlias Property AmbushCreature1  Auto  

ReferenceAlias Property AmbushCreature2  Auto  

ReferenceAlias Property AmbushCreature3  Auto  
