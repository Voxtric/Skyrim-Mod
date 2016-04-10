;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 6
Scriptname BYOH_QF_BYOHHouseBanditPacifi_010008C3 Extends Quest Hidden

;BEGIN ALIAS PROPERTY BanditLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_BanditLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit08 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit10
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit10 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bandit09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bandit09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
debug.trace(self + " STOPPING")
; restore original aggression
;int iIndex = 0
;while iIndex < BanditAliases.Length
;	BanditAliases[iIndex].GetActorRef().SetActorValue("Aggression", OriginalAggression[iIndex])
;	iIndex = iIndex + 1
;endWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
debug.trace(self + " STARTING")
;int iIndex = 0
;while iIndex < BanditAliases.Length
;	OriginalAggression[iIndex] = BanditAliases[iIndex].GetActorRef().GetActorValue("Aggression") as int
;	BanditAliases[iIndex].GetActorRef().SetActorValue("Aggression", 1)
;	iIndex = iIndex + 1
;endWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias[] Property BanditAliases  Auto  

Int[] Property OriginalAggression  Auto  
{store starting aggression for bandits}
