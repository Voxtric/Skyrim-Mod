;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 2
Scriptname DLC2_QF_DLC2RRArrivalScene_0202ADDA Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC2RRASAdrilAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRASAdrilAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRASGuardAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRASGuardAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GjalundMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GjalundMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRASRavenRockLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DLC2RRASRavenRockLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC2RRASGjalundAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC2RRASGjalundAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Kicked off by trigger break
pDLC2RRArrivalGoScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Scene Done
pDLC2RRASGo.SetValue(1)
Alias_DLC2RRASGjalundAlias.GetActorRef().EvaluatePackage()
Alias_DLC2RRASAdrilAlias.GetActorRef().EvaluatePackage()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property pDLC2RRArrivalGoScene  Auto  

GlobalVariable Property pDLC2RRASGo  Auto  
