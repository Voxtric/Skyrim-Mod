;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC2_QF_DLC2dunKolbjornMiscQS_0202667E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Ralis
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ralis Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Complete either or both misc objectives when the player speaks to Ralis.
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;"Speak to Ralis" objective.
;Set by: Innkeeper Rumor in Retching Netch.
;Completed by: Speaking to Ralis.
SetObjectiveDisplayed(10)
DLC2dunKolbjornMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;"Investigate Kolbjorn" objective.
;Set by: Reading the book on Ahzidal.
;Completed by: Speaking to Ralis.
SetObjectiveDisplayed(20)
DLC2dunKolbjornMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC2dunKolbjornQST  Auto  

ObjectReference Property DLC2dunKolbjornMapMarker  Auto  
