;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 4
Scriptname DLC1_QF_DLC1VQ00ChangeLocatio_0100D90B Extends Quest Hidden

;BEGIN ALIAS PROPERTY LocationCenterMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LocationCenterMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Location
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_Location Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Messenger
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Messenger Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
debug.trace(self + " stage 0, start up")
DLC1VQ00.Start()
; make sure hall is destroyed
DLC1VQ01MiscObjective.SetStage(5)
; put messenger into aliases on VQ00
VQ00Location.ForceLocationTo(Alias_Location.GetLocation())
VQ00LocationCenter.ForceRefTo(Alias_LocationCenterMarker.GetReference())
VQ00Messenger.ForceRefTo(Alias_Messenger.GetRef())

;move to location center marker and enable
Alias_Messenger.getReference().moveto(Alias_LocationCenterMarker.getReference())
Alias_Messenger.getReference().enable()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; debug.trace(self + "stage 200, shut down")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC1VQ00  Auto  

ReferenceAlias Property VQ00Messenger Auto  

ReferenceAlias Property VQ00LocationCenter  Auto  

LocationAlias Property VQ00Location  Auto  

Quest Property DLC1VQ01MiscObjective  Auto  
{use this to destroy Hall of Vigilants when quest starts}
