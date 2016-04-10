;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC1_QF_DLC1SeranaCureSelfQue_01005044 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Serana
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Serana Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HomeMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HomeMarker Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; with falion; wait three days
Utility.WaitGameTime(72)
SetStage(100)

Alias_Serana.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; quest done

; Stop() ; we're keeping this open now so the alias script stays on her
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN AUTOCAST TYPE DLC1SeranaCureQuestScript
Quest __temp = self as Quest
DLC1SeranaCureQuestScript kmyQuest = __temp as DLC1SeranaCureQuestScript
;END AUTOCAST
;BEGIN CODE
; serana cured; going to/at home

kmyQuest.Cure()

Alias_Serana.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; traveling to falion

MM.Dismiss()

Alias_Serana.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


DLC1_NPCMentalModelScript Property MM Auto
