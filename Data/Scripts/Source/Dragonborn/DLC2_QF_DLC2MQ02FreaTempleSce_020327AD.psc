;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_QF_DLC2MQ02FreaTempleSce_020327AD Extends Quest Hidden

;BEGIN ALIAS PROPERTY Ysra
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ysra Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Oslaf
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Oslaf Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;start up

;Move actors to their markers
Alias_Frea.GetReference().Moveto(FreaInitialMarker)
Alias_Oslaf.GetReference().Moveto(OslafInitialMarker)
Alias_Ysra.GetReference().Moveto(YsraInitialMarker)

;Enable Frea
Alias_Frea.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;shut down

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property FreaInitialMarker  Auto  

ObjectReference Property OslafInitialMarker  Auto  

ObjectReference Property YsraInitialMarker  Auto  
