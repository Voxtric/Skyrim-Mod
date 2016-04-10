;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC1_QF_DLC1VQ03RNPC_0100F363 Extends Quest Hidden

;BEGIN ALIAS PROPERTY RNPC
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RNPC Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE dlc1vq03rnpcquestscript
Quest __temp = self as Quest
dlc1vq03rnpcquestscript kmyQuest = __temp as dlc1vq03rnpcquestscript
;END AUTOCAST
;BEGIN CODE
kmyQuest.MM.WillingToTradeItemsWithplayer = true
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE dlc1vq03rnpcquestscript
Quest __temp = self as Quest
dlc1vq03rnpcquestscript kmyQuest = __temp as dlc1vq03rnpcquestscript
;END AUTOCAST
;BEGIN CODE
(HelloQuest as DLC1NPCGeneralChattyScript).TimeOut()
kmyQuest.MM.WillingToTradeItemsWithplayer = true
; swap Fort Dawnguard map markers so you now travel right to the main fort gate
DawnguardValleyMapMarker.Disable()
DawnguardFortMapMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property HelloQuest  Auto  

ObjectReference Property DawnguardValleyMapMarker  Auto  

ObjectReference Property DawnguardFortMapMarker  Auto  
