;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC1_SF_DLC1HunterBaseIntroSt_0100BDF7 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
(GetOwningQuest() as DLC1HunterBaseIntroQuestScript).StartSceneDone=1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;getowningquest().setstage(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property IsranAlias  Auto  

ReferenceAlias Property BeaconVigilant1  Auto  

ReferenceAlias Property BeaconVigilant2  Auto  

ReferenceAlias Property BeaconVigilant3  Auto  

ObjectReference Property IsranSceneMarker  Auto  

ObjectReference Property TolanSceneMarker  Auto  

ObjectReference Property Vigilant1SceneMarker  Auto  

ObjectReference Property Vigilant2SceneMarker  Auto  

ObjectReference Property Vigilant3SceneMarker  Auto  

ReferenceAlias Property TolanAlias  Auto  
