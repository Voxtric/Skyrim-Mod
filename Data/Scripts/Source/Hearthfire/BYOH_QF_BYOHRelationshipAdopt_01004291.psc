;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname BYOH_QF_BYOHRelationshipAdopt_01004291 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ConstanceMichel
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ConstanceMichel Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Player has adopted two children, so no further adoption is allowed.
((Self as Quest) as BYOHRelationshipAdoptableScript).DisableNewAdoptions()

;Quest remains running because RelationshipAdoption needs to call script functions on it.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;BYOHRelationshipAdoptable handles generic pre-Adoption dialogue, including the dialogue for
;orphanable children (those whose parents can be killed).
;
;It remains in Stage 0 until the player adopts two children, then switches to 255
;to close off the dialogue options.

;Run the Adoption system setup when BYOH starts.
Debug.Trace("---BYOH Adoption System has started.---")
((self as Quest) as BYOHRelationshipAdoptableScript).BYOHAdoptionStartup()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
