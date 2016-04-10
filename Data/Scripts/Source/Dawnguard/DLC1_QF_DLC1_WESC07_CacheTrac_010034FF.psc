;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC1_QF_DLC1_WESC07_CacheTrac_010034FF Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC01Cache05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC01Cache05 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC01Cache06
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC01Cache06 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC01Cache04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC01Cache04 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_DLC01Cache04.GetReference().Enable()
Alias_DLC01Cache05.GetReference().Enable()
Alias_DLC01Cache06.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if (GetStageDone(4) && !GetStageDone(5))
     Alias_DLC01Cache05.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(5) && !GetStageDone(4))
     Alias_DLC01Cache04.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(4) && GetStageDone(5))
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
if (GetStageDone(4) && !GetStageDone(6))
     Alias_DLC01Cache06.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(6) && !GetStageDone(4))
     Alias_DLC01Cache04.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(4) && GetStageDone(6))
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
if (GetStageDone(5) && !GetStageDone(6))
     Alias_DLC01Cache05.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(6) && !GetStageDone(5))
     Alias_DLC01Cache05.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(5) && GetStageDone(6))
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property RewardItem  Auto  

Int Property RewardCount  Auto  
