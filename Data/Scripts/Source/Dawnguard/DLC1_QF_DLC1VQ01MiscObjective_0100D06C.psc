;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 32
Scriptname DLC1_QF_DLC1VQ01MiscObjective_0100D06C Extends Quest Hidden

;BEGIN ALIAS PROPERTY Durak
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Durak Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FortDawnguardWorldspaceDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FortDawnguardWorldspaceDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Tolan
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Tolan Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IsranLookUpMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IsranLookUpMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Agmaer
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Agmaer Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FortDawnguardLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_FortDawnguardLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Isran
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Isran Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Celann
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Celann Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; player asks how he can help - advance scene
DLC1VQ01IsranIntroScene.Stop()
DLC1VQ01IsranAgmaerScene.Stop()
DLC1VQ01IsranTolanDimhollowScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; player speaks to Isran
; stop VQ00 if still running
DLC1VQ00.Stop()
; stop intro scene if still running
DLC1VQ01IsranIntroScene.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
; player approaches Isran
DLC1VQ01IsranIntroScene.Stop()
Alias_Isran.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; player enters Dawnguard worldspace
DLC1VQ01AgmaerScene.Start()
; move Durak if he's not loaded
if Alias_Durak.GetRef().Is3DLoaded() == 0
	Alias_Durak.GetRef().MoveTo(DurakMoveMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_25
Function Fragment_25()
;BEGIN CODE
; Celann moves to gate
Alias_Celann.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Shut down stage, triggered when stage 10 is set on DLC1VQ01
SetObjectiveCompleted(10,1)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
; player gets objective to Dimhollow - start VQ01
DLC1VQ01.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; destroy Hall of Vigilants when this quest starts
debug.trace(self + " starting")
DLC1HallNormalState.Disable()
HallofVigilantBossChest.moveto(HallofVigilantBossChestMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; player enters interior - advance scene
DLC1VQ01IsranIntroScene.Start() ; just in case
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
; player reaches main fort gate
; start Tolan/Isran scene
DLC1VQ01AgmaerScene.Stop()
DLC1VQ01IsranIntroScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_27
Function Fragment_27()
;BEGIN CODE
; intro scene ends without player interrupting
; start Isran/Agmaer scene
DLC1VQ01IsranAgmaerScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_31
Function Fragment_31()
;BEGIN CODE
CompleteAllObjectives()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN CODE
; give player crossbow
debug.trace(self + " STAGE 190")
Game.GetPlayer().AddItem(DLC1Crossbow, 1)
Game.GetPlayer().AddItem(DLC1BoltSteel, 45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN CODE
debug.trace(self + " STAGE 130")
Alias_Agmaer.GetRef().AddItem(DLC1Crossbow, 1)
Alias_Agmaer.GetRef().AddItem(DLC1BoltSteel, 15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN CODE
; Durak gives player a crossbow
Game.GetPlayer().AddItem(DLC1Crossbow, 1)
Game.GetPlayer().AddItem(DLC1BoltSteel, 45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
; Isran/Tolan scene done
; start Isran/Agmaer scene if it hasn't already happened
SetStage(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
DawnguardMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC1HallNormalState  Auto  

ObjectReference Property DawnguardMapMarker  Auto  

Scene Property DLC1VQ01AgmaerScene  Auto  

Scene Property DLC1VQ01IsranIntroScene  Auto  

Quest Property DLC1VQ01  Auto  

WEAPON Property DLC1CrossBow  Auto  

Ammo Property DLC1BoltSteel  Auto  

Scene Property DLC1VQ01IsranTolanDimhollowScene  Auto  

Scene Property DLC1VQ01IsranAgmaerScene  Auto  

Quest Property DLC1VQ00  Auto  

ObjectReference Property DurakMoveMarker  Auto  

ObjectReference Property HallofVigilantBossChest  Auto  

ObjectReference Property HallofVigilantBossChestMarker  Auto  
