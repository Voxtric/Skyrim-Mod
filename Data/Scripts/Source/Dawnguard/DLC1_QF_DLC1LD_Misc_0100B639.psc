;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 9
Scriptname DLC1_QF_DLC1LD_Misc_0100B639 Extends Quest Hidden

;BEGIN ALIAS PROPERTY QT_D1KatriaCorpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D1KatriaCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_KatriaIntroBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_KatriaIntroBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_D3BookCorpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D3BookCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_Katria
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_Katria Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_Shard1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_Shard1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_RaldbtharIntroBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_RaldbtharIntroBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_D4BookCorpse
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_D4BookCorpse Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_DeepFolkIntroBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_DeepFolkIntroBook Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY QT_MzulftIntroBook
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_QT_MzulftIntroBook Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
;Shut down the quest when Stages 10 & 12 (both objectives) are complete.
CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Set & Completed by DLC1LD
;Player finds Fragment #2 in Raldbthar02. Give pointer to identifier (book in Raldbthar01).
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Set & Completed by DLC1LD
;Player finds Fragment #3 in Deep Folk Crossing. Give pointer to identifier (book on warlock corpse).
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Set & Completed by DLC1LD
;Player reads the quest book. Give misc objective pointing to Arkngthamz.
SetObjectiveDisplayed(10)
MapMarkerArkngthamz.AddToMap(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Set & Completed by DLC1LD
;Player finds Fragment #1 in Arkngthamz. Give pointer to identifier (Katria, or book on her corpse).
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
;Set & Completed by DLC1LD
;Player finds Fragment #4 in Mzulft zCell. Give pointer to identifier (book on warlock corpse).
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
;Set & Completed by DLC1LD
;Player reads the quest book. Complete the Identify objective.
if (IsObjectiveDisplayed(20))
     SetObjectiveCompleted(20)
EndIf

;Are we done?
if (GetStageDone(12) && GetStageDone(10))
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
;Set & Completed by DLC1LD
;Player acquires the shard in Arkngthamz. Finish the pointer objective.
if (IsObjectiveDisplayed(10))
     SetObjectiveCompleted(10)
EndIf

;Are we done?
if (GetStageDone(12) && GetStageDone(10))
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property MapMarkerArkngthamz  Auto  
