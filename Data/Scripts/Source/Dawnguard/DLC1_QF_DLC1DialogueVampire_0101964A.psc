;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 23
Scriptname DLC1_QF_DLC1DialogueVampire_0101964A Extends Quest Hidden

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; Player takes Unearthly Will perk

Game.IncrementStat("NumVampirePerks")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
; Player takes Poison Talons perk

Game.IncrementStat("NumVampirePerks")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Add spell to player if he takes the perk

Game.IncrementStat("NumVampirePerks")
If DLC1VampireLevitateStateGlobal.GetValue() == 2
    Game.GetPlayer().AddSpell(DLC1CorpseCurse)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Add spell to player if he takes the perk

Game.IncrementStat("NumVampirePerks")
If DLC1VampireLevitateStateGlobal.GetValue() == 2
    Game.GetPlayer().AddSpell(DLC1ConjureGargoyleLeftHand)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Add spell to player if he takes the perk

Game.IncrementStat("NumVampirePerks")
Game.GetPlayer().AddSpell(DLC1VampireMistform)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN CODE
; Player takes Night Cloak perk

Game.GetPlayer().AddSpell(DLC1NightCloak)
Game.IncrementStat("NumVampirePerks")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Add spell to player if he takes the perk

Game.IncrementStat("NumVampirePerks")
If DLC1VampireLevitateStateGlobal.GetValue() == 2
    Game.GetPlayer().AddSpell(DLC1VampiresGrip)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; Add spell to player if he takes the perk

Game.IncrementStat("NumVampirePerks")
Game.GetPlayer().AddSpell(DLC1DetectLife)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
; Player takes Blood Healing perk

Game.IncrementStat("NumVampirePerks")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; Add spell to player if he takes the perk

Game.IncrementStat("NumVampirePerks")
Game.GetPlayer().AddSpell(DLC1SupernaturalReflexes)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
; Player takes Power of the Grave perk

Game.IncrementStat("NumVampirePerks")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property DLC1VampiresGrip  Auto  

SPELL Property DLC1VampireMistform  Auto  

SPELL Property DLC1CorpseCurse  Auto  

SPELL Property DLC1ConjureGargoyleLeftHand  Auto  

SPELL Property DLC1VampireBats  Auto  

SPELL Property DLC1SupernaturalReflexes  Auto  

GlobalVariable Property DLC1VampireLevitateStateGlobal  Auto  

SPELL Property DLC1NightCloak  Auto  

SPELL Property DLC1DetectLife  Auto  
