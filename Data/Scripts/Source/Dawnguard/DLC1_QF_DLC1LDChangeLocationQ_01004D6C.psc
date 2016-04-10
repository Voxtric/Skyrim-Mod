;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_QF_DLC1LDChangeLocationQ_01004D6C Extends Quest Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;This quest starts whenever the player enters one of the five associated locations, runs this script,
;and then shuts down immediately. This can and will run multiple times.

;Start DLC1LD if it wasn't running before.
if (!DLC1LD.IsRunning())
     DLC1LD.Start()
EndIf

;Update Katria's Sketchbook based on where the player is.
if (Game.GetPlayer().GetCurrentLocation() == DLC1ArkngthamzLocation)
     DLC1LD.SetStage(71)
ElseIf (Game.GetPlayer().GetCurrentLocation() == RaldbtharLocation)
     DLC1LD.SetStage(72)
ElseIf (Game.GetPlayer().GetCurrentLocation() == DeepFolkCrossingLocation)
     DLC1LD.SetStage(73)
ElseIf (Game.GetPlayer().GetCurrentLocation() == MzulftLocation)
     DLC1LD.SetStage(74)
ElseIf (Game.GetPlayer().GetCurrentLocation() == BthalftLocation)
     DLC1LD.SetStage(75)
Else
     Debug.Trace("DLC1LD_ChangeLocation fired in an unexpected location: " + Game.GetPlayer().GetCurrentLocation())
EndIf

;Stop the quest so it's ready to run again.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC1LD  Auto  

Location Property BthalftLocation  Auto  

Location Property DLC1ArkngthamzLocation  Auto  

Location Property DeepFolkCrossingLocation  Auto  

Location Property MzulftLocation  Auto  

Location Property RaldbtharLocation  Auto  
