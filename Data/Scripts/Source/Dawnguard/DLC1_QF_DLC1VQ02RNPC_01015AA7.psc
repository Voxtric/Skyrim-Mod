;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_QF_DLC1VQ02RNPC_01015AA7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY RNPC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RNPC Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
(HelloQuest as DLC1NPCGeneralChattyScript).TimeOut()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property HelloQuest  Auto  
DLC1_NPCMentalModelScript Property MM Auto