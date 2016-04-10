;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 30
Scriptname QF_DLC01VQ01_0100352A Extends Quest Hidden

;BEGIN ALIAS PROPERTY SeranaCloaking
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SeranaCloaking Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DimhollowEntrance
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DimhollowEntrance Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Serana
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Serana Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Agmaer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Agmaer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Sarcophagus
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Sarcophagus Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PuzzleRoomVampireThrall
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PuzzleRoomVampireThrall Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Adalvald
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Adalvald Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tolan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tolan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PuzzleRoomVampire1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PuzzleRoomVampire1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DimhollowCrypt
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_DimhollowCrypt Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Vampire1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Vampire1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PuzzleRoomVampireBoss
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PuzzleRoomVampireBoss Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Book
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Book Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
;Startup Stage
DLC1VQ01MiscObjective.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Stage 10, player has accepted the quest
;Turn on vampires and open tunnel in dungeon 01 by enabling the controlling XMarker
OpenDungeon.Enable()
SetObjectiveDisplayed(30)
DimhollowMapMarker.AddToMap()
SetActive()
DLC1VQ01RNPC.Start()

; restrain Adalvald
Alias_Adalvald.GetActorRef().SetRestrained(true)

; Serana ignores friendly hits during Dimhollow so she can't aggro on you and trap you inside
Alias_Serana.GetActorRef().IgnoreFriendlyHits(true)

;Changing how this works
; reset eclipse attack global chance so it's back to 100 for when eclipse attacks start
;DLC1EclipseAttackNextChance.SetValue(100.0) -- OBSOLETE
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Null stage, never use or set. DO NOT REMOVE
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Completion stage
SetObjectiveCompleted(40,1)
Game.AddAchievement(51)
VQ02.SetStage(5)

DLC1VQ01RNPC.Stop()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
; Tolan ready to talk about why vampires attacked Hall of Vigilants
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; puzzle room scene ends, somehow - make sure Adalvald is dead
Alias_Adalvald.GetActorRef().Kill()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Stage 20
;The player has opened Serana's coffin.  She stumbles out and gets the scroll.
SetObjectiveCompleted(30,1)
SetObjectiveDisplayed(40,1)
;DLC1VQ01St20SeranaGetScroll.Start()
SeranaExitScene.Start()
; remove Serana from vampire friend faction
Alias_Serana.GetActorRef().RemoveFromFaction(DLC1VQ01CaptiveFaction)
; failsafe
Alias_Serana.GetActorRef().IgnoreFriendlyHits(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN CODE
; start puzzle room scene
DLC1VQ01PuzzleRoomScene.Start()
Alias_Adalvald.GetActorRef().SetActorValue("health", 1)
; failsafe
Alias_Serana.GetActorRef().IgnoreFriendlyHits(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; player has activated puzzle
setstage(18) ; just in case
VampireFaction.SendAssaultAlarm()
; failsafe
Alias_Serana.GetActorRef().IgnoreFriendlyHits(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
;This stage is set when Serana picks up the scroll after falling out of her coffin. She will now forcegreet.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Stage set to prevent Serana forcegreeting again. Should be set on walk-away.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; disable Tolan
Alias_Tolan.GetActorRef().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;Player has arrived at the vampires' cave and hears their scene
DLC1VQ01Stage15VampireScene1.Start()
; shut down DLC1VQ01MiscObjective
DLC1VQ01MiscObjective.Stop()

; wound vampires
actor vampire1 = Alias_Vampire1.GetActorRef()
actor vampire2 = Alias_Vampire2.GetActorRef()

vampire1.DamageActorValue("Health", vampire1.GetBaseActorValue("Health") * 0.35)
vampire2.DamageActorValue("Health", vampire2.GetBaseActorValue("Health") * 0.65)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property HallNormal  Auto  

ObjectReference Property HallRuined  Auto  

ReferenceAlias Property Serana  Auto  

ObjectReference Property StandMarker  Auto  

ReferenceAlias Property Sarcophagus  Auto  

Quest Property VQ02  Auto  

ObjectReference Property OpenDungeon  Auto  

Scene Property Stage15VampireScene  Auto  

Quest Property DLC1VQ01MiscObjective  Auto  

Scene Property DLC1VQ01St20SeranaGetScroll  Auto  

Scene Property DLC1VQ01Stage15VampireScene1  Auto  

Scene Property SeranaExitScene  Auto  

DLC1_NPCMentalModelScript Property MM Auto

ObjectReference Property DimhollowMapMarker  Auto  

Quest Property DLC1VQ01RNPC  Auto  

ObjectReference Property TolanDimhollowMoveMarker  Auto  

Scene Property DLC1VQ01PuzzleRoomScene  Auto  

Faction Property VampireFaction  Auto  

Faction Property DLC1VQ01CaptiveFaction  Auto  

GlobalVariable Property DLC1EclipseAttackNextChance  Auto  
{global chance for town "vampire" attacks
reset to 100 when VQ01 starts so it's ready for
eclipse attacks}
