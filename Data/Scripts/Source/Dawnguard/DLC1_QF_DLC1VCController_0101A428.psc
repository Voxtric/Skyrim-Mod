;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 13
Scriptname DLC1_QF_DLC1VCController_0101A428 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC1VQMainDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQMainDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VCBossDoorInside
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VCBossDoorInside Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VQTutorialDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VQTutorialDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VCBossDoor001
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VCBossDoor001 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN AUTOCAST TYPE dlc1vampirecastlecontrollerscript
Quest __temp = self as Quest
dlc1vampirecastlecontrollerscript kmyQuest = __temp as dlc1vampirecastlecontrollerscript
;END AUTOCAST
;BEGIN CODE
;Debug stage to force fill aliases
Alias_DLC1VCBossDoor001.ForceRefTo(kmyQuest.DLC1VCBossDoorGH)
Alias_DLC1VCBossDoorInside.ForceRefTo(kmyQuest.DLC1VCBossDoor)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN AUTOCAST TYPE dlc1vampirecastlecontrollerscript
Quest __temp = self as Quest
dlc1vampirecastlecontrollerscript kmyQuest = __temp as dlc1vampirecastlecontrollerscript
;END AUTOCAST
;BEGIN CODE
;Dump clean up lists
kmyQuest.PrintCleanupList()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN AUTOCAST TYPE dlc1vampirecastlecontrollerscript
Quest __temp = self as Quest
dlc1vampirecastlecontrollerscript kmyQuest = __temp as dlc1vampirecastlecontrollerscript
;END AUTOCAST
;BEGIN CODE
;Debug Stage to test tutorial room cleanup
kmyQuest.StartTutorialRoomCleanup()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN AUTOCAST TYPE dlc1vampirecastlecontrollerscript
Quest __temp = self as Quest
dlc1vampirecastlecontrollerscript kmyQuest = __temp as dlc1vampirecastlecontrollerscript
;END AUTOCAST
;BEGIN CODE
;Debug Enable Stairs to courtyard
kmyQuest.EnableDoorToCourtyard()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN AUTOCAST TYPE dlc1vampirecastlecontrollerscript
Quest __temp = self as Quest
dlc1vampirecastlecontrollerscript kmyQuest = __temp as dlc1vampirecastlecontrollerscript
;END AUTOCAST
;BEGIN CODE
;Start up stage, set up anything we need for the castle
kmyQuest.pMainGate = kmyQuest.pDLC1VCMainGateRef as DLC1_2StateActivatorWithGlobal
kmyQuest.LockBalconyDoor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN AUTOCAST TYPE dlc1vampirecastlecontrollerscript
Quest __temp = self as Quest
dlc1vampirecastlecontrollerscript kmyQuest = __temp as dlc1vampirecastlecontrollerscript
;END AUTOCAST
;BEGIN CODE
;Debug Toggle state of Castle Courtyard
if !kmyQuest.ValericasGardenEnabled
	kmyQuest.EnableValericasGarden(true)
else
	kmyQuest.EnableValericasGarden(False)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
