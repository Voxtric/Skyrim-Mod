;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 14
Scriptname DLC2_QF_DLC2MQ00_02026242 Extends Quest Hidden

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Frea has talked to player post-MQ06
DLC2MQ06.SetStage(700)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; learned Temple of Miraak word
if DLC2WWDragonAspect.value >= 3
;if Game.IsWordUnlocked(DLC2DragonAspectWord1) && Game.IsWordUnlocked(DLC2DragonAspectWord2) && Game.IsWordUnlocked(DLC2DragonAspectWord3)
	Game.AddAchievement(70)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; show all the Stones on the player's map
BeastStoneMapMarker.AddToMap()
EarthStoneMapMarker.AddToMap()
WaterStoneMapMarker.AddToMap()
SunStoneMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; learn Dragon aspect word in Bloodskal Barrow
if DLC2WWDragonAspect.value >= 3
;if Game.IsWordUnlocked(DLC2DragonAspectWord1) && Game.IsWordUnlocked(DLC2DragonAspectWord2) && Game.IsWordUnlocked(DLC2DragonAspectWord3)
	Game.AddAchievement(70)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Frea gives player BlackBook02 - new one (giving player original one after it was moved to Frea didn't work)
; force into DLC2Init alias (so it stays a quest item)
BlackBook02Final.ForceRefTo(DLC2BlackBook02RefFrea)
Game.GetPlayer().AddItem(DLC2BlackBook02RefFrea)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; finish Frea post-MQ conversation
DLC2MQ06.SetStage(1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player has learned word in MQ06 dungeon
if DLC2MQ06.GetStageDone(100)
     DLC2MQ06.Setstage(250)
endif
if DLC2WWDragonAspect.value >= 3
;if Game.IsWordUnlocked(DLC2DragonAspectWord1) && Game.IsWordUnlocked(DLC2DragonAspectWord2) && Game.IsWordUnlocked(DLC2DragonAspectWord3)
	Game.AddAchievement(70)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


ObjectReference Property WaterStoneMapMarker  Auto  
ObjectReference Property EarthStoneMapMarker  Auto  
ObjectReference Property BeastStoneMapMarker  Auto  
ObjectReference Property SunStoneMapMarker  Auto  



Quest Property DLC2MQ06  Auto  

WordOfPower Property DLC2DragonAspectWord1  Auto  

WordOfPower Property DLC2DragonAspectWord2  Auto  

WordOfPower Property DLC2DragonAspectWord3  Auto  

GlobalVariable Property DLC2WWDragonAspect  Auto  

ObjectReference Property DLC2BlackBook02RefFrea  Auto  

ReferenceAlias Property BlackBook02Final  Auto  
