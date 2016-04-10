;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 1
Scriptname DLC1_QF_DLC1LD_Postquest_0100CFFD Extends Quest Hidden

;BEGIN ALIAS PROPERTY AetherialCrown
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AetherialCrown Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Swap out the Aetherial Crown in the player's inventory with the one in the alias.
Game.GetPlayer().RemoveItem(DLC1LD_AetherialCrown, 1, True)
Game.GetPlayer().AddItem(Alias_AetherialCrown.GetReference(), 1, True)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Armor Property DLC1LD_AetherialCrown  Auto  
