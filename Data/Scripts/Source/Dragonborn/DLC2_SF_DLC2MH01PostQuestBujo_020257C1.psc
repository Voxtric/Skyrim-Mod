;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC2_SF_DLC2MH01PostQuestBujo_020257C1 Extends Scene Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if (!DLC2MQ06.IsCompleted())
    Nord4.Clear()
    Nord5.Clear()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
Bujold.GetRef().Disable()
ThirskDoor.BlockActivation(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
DLC2MH01KuvarLike.SetValueInt(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
ThirskDoor.BlockActivation()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC2MH01KuvarLike  Auto  

ReferenceAlias Property Bujold  Auto  

ObjectReference Property ThirskDoor  Auto  

Quest Property DLC2MQ06  Auto  

ReferenceAlias Property Nord4  Auto  

ReferenceAlias Property Nord5  Auto  
