;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 3
Scriptname DLC1_PRKF_DLC1LD_AetherialCro_0100D00A Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
;Debug.Trace("Aetherial Crown Perk received Activation.")
(AetherialCrown as DLC1LD_AetherialCrownScript).DoomstoneActivated()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property AetherialCrown  Auto  
