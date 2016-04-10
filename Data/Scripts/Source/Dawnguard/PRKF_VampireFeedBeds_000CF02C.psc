;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 17
Scriptname PRKF_VampireFeedBeds_000CF02C Extends Perk Hidden

;BEGIN FRAGMENT Fragment_15
Function Fragment_15(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
DLC1VampireTurn.PlayerBitesMe(akTargetRef as actor)
Game.GetPlayer().StartVampireFeed(aktargetRef as actor)
PlayerVampireQuest.VampireFeed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
DLC1VampireTurn.PlayerBitesMe(akTargetRef as actor)
Game.GetPlayer().StartVampireFeed(aktargetRef as actor)
PlayerVampireQuest.VampireFeed()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

PlayerVampireQuestScript Property PlayerVampireQuest  Auto  

dlc1vampireturnscript Property DLC1VampireTurn  Auto  
