;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 33
Scriptname DLC2_QF_DLC2_dunMQ02_02027EC7 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Gatekeeper
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Gatekeeper Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Frea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Frea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FreaHeadTrackCatacombs02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FreaHeadTrackCatacombs02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FreaHeadTrackCatacombs01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FreaHeadTrackCatacombs01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TempleofMiraakLoc
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_TempleofMiraakLoc Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FreaHeadtrackStatue01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FreaHeadtrackStatue01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FreaHeadtrackDragon01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FreaHeadtrackDragon01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Follower
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Follower Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;player opened gate in statuary room
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
FreaScene26.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Player has disarmed blade trap in 01
FreaScene05.stop()
FreaScene06.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Embalming Chamber in 01
FreaScene02.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Check for supplies
FreaScene01.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
;Frea comments on Dragon Bones
FreaScene22.stop()
FreaScene22b.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Frea's dialogue for TempleOfMiraak01 are in Stages 100-199
;Frea's dialogue for TempleOfMiraak02 are in Stages 200-299
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Player finds a way to secret area of Catacombs
FreaScene03.stop()
FreaScene04.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player continues on
FreaScene03.stop()
FreaScene04.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
;Getting close to the pillar activator
FreaScene25.stop()
FreaScene26.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN CODE
;player is in the secret tunnel
FreaScene24.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;going down, down, down
FreaScene22.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
;Entered the book room
FreaScene25.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN CODE
;found the secret door in dining area
SecFound = true
FreaScene23.stop()
FreaScene24.start()
setStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN CODE
;Secret area in 02 after bridge
FreaScene20.stop()
FreaScene21.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
;dining area
FreaScene22b.stop()
if(!SecFound)
   FreaScene23.start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
;blank
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Blade Trap Hallway
FreaScene05.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
;Bone Bridge in 02
FreaScene06.stop()
FreaScene20.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Entrance to Catacombs01
FreaScene02.stop()
FreaScene03.start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
;player has moved on
FreaScene21.stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN CODE
;player has learned the word of power
; for achievement:
DLC2MQ00.SetStage(21)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Player has proceeded further into dungeon
FreaScene01.stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property FreaScene01  Auto  

Scene Property FreaScene02  Auto  

Scene Property FreaScene03  Auto  

Scene Property FreaScene04  Auto  

Scene Property FreaScene05  Auto  

Scene Property FreaScene06  Auto  

Scene Property FreaScene20  Auto  

Scene Property FreaScene21  Auto  

Scene Property FreaScene22  Auto  

Scene Property FreaScene23  Auto  

Scene Property FreaScene24  Auto  

Scene Property FreaScene25  Auto  

Bool Property SecFound = False Auto  

Scene Property ChattyCultists01  Auto  

Faction Property PlayerFaction  Auto  

Scene Property FreaScene26  Auto  

Scene Property FreaScene22b  Auto  

Quest Property DLC2MQ00  Auto  
