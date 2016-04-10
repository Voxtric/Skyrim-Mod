;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC1_QF_DLC1_WESC06_CacheTrac_010034F8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC01Cache03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC01Cache03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC01Cache01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC01Cache01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC01Cache02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC01Cache02 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_DLC01Cache01.GetReference().Enable()
Alias_DLC01Cache02.GetReference().Enable()
Alias_DLC01Cache03.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if (GetStageDone(1) && !GetStageDone(2))
     Alias_DLC01Cache02.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(2) && !GetStageDone(1))
     Alias_DLC01Cache01.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(1) && GetStageDone(2))
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
if (GetStageDone(1) && !GetStageDone(3))
     Alias_DLC01Cache03.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(3) && !GetStageDone(1))
     Alias_DLC01Cache01.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(1) && GetStageDone(3))
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
if (GetStageDone(2) && !GetStageDone(3))
     Alias_DLC01Cache03.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(3) && !GetStageDone(2))
     Alias_DLC01Cache02.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(2) && GetStageDone(3))
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property RewardItem  Auto  

Int Property RewardCount  Auto  
