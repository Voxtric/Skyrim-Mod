;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC2_SF_DLC2MQ01Vision_020186AF Extends Scene Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;GetOwningQuest().SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
DLC2MiraakScript MiraakRef = Miraak.GetActorReference() as DLC2MiraakScript 
MiraakRef.Appear()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Location Property SolstheimLocation  Auto  

ReferenceAlias Property Miraak  Auto  
