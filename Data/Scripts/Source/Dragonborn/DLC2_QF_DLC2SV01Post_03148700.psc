;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC2_QF_DLC2SV01Post_03148700 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Tharstan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tharstan Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Shutdown stage.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Startup stage. Quests starts when SV01 ends.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Set when the player returns to Skaal Village after SV01 is complete.
;Causes Tharstan to come back from the Tomb
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
