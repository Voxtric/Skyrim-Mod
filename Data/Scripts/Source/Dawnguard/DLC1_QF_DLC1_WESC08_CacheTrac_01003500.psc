;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC1_QF_DLC1_WESC08_CacheTrac_01003500 Extends Quest Hidden

;BEGIN ALIAS PROPERTY DLC01Cache09
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC01Cache09 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC01Cache07
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC01Cache07 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC01Cache08
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC01Cache08 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
Alias_DLC01Cache07.GetReference().Enable()
Alias_DLC01Cache08.GetReference().Enable()
Alias_DLC01Cache09.GetReference().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
if (GetStageDone(7) && !GetStageDone(8))
     Alias_DLC01Cache08.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(8) && !GetStageDone(7))
     Alias_DLC01Cache07.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(7) && GetStageDone(8))
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
if (GetStageDone(7) && !GetStageDone(9))
     Alias_DLC01Cache09.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(9) && !GetStageDone(7))
     Alias_DLC01Cache07.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(7) && GetStageDone(9))
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
if (GetStageDone(8) && !GetStageDone(9))
     Alias_DLC01Cache09.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(9) && !GetStageDone(8))
     Alias_DLC01Cache08.GetReference().AddItem(RewardItem, RewardCount)
ElseIf (GetStageDone(8) && GetStageDone(9))
     Stop()
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property RewardItem  Auto  

Int Property RewardCount  Auto  
