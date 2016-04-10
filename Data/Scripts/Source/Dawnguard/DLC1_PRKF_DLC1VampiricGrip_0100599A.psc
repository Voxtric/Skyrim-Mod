;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 10
Scriptname DLC1_PRKF_DLC1VampiricGrip_0100599A Extends Perk Hidden

;BEGIN FRAGMENT Fragment_1
Function Fragment_1(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
VampireTransformDecreaseISMD.applyCrossFade(2.0)
utility.wait(2.0)
imageSpaceModifier.removeCrossFade()

(akTargetRef as actor).DamageAV("health", 25)
	
Game.IncrementStat( "Necks Bitten" )
DLCPlayerVampireFeedMsg.Show()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Message Property DLCPlayerVampireFeedMsg  Auto  

ImageSpaceModifier Property VampireTransformDecreaseISMD  Auto  
