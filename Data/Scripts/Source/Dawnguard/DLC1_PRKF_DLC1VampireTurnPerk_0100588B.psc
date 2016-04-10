;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 7
Scriptname DLC1_PRKF_DLC1VampireTurnPerk_0100588B Extends Perk Hidden

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
debug.trace(self + "PLAYER IS MAKING A VAMPIRE")
DLC1VampireTurn.TurnMeIntoVampire(akTargetRef as Actor)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC1VampireTurnScript Property DLC1VampireTurn  Auto  
