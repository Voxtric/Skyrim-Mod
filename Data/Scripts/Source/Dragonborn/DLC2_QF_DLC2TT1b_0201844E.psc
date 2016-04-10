;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC2_QF_DLC2TT1b_0201844E Extends Quest Hidden

;BEGIN ALIAS PROPERTY Mogrul
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Mogrul Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Mogrul delivers ultimatum

DLC2Mogrul.SetEssential(false)
SetObjectiveDisplayed(200, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; player talked to Drelvas about the money
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; Player pays Mogrul

SetObjectiveCompleted(200, true)
SetObjectiveCompleted(210, true)

Game.GetPlayer().RemoveItem(Gold, 1000)
Alias_Mogrul.GetActorRef().AddItem(Gold, 1000)

AchievementsQuest.IncSideQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
; Player kills Mogrul

SetObjectiveCompleted(200, true)
SetObjectiveCompleted(210, true)

AchievementsQuest.IncSideQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
; Player pays Mogrul half through intimidation

SetObjectiveCompleted(200, true)
SetObjectiveCompleted(210, true)

Game.GetPlayer().RemoveItem(Gold, 500)
Alias_Mogrul.GetActorRef().AddItem(Gold, 500)

AchievementsQuest.IncSideQuests()
stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
; Message delivered

DLC2Mogrul.SetEssential(false)
SetObjectiveDisplayed(100, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Quest starts, Mogrul starts looking for player any time he is in Raven Rock

; DLC2MogrulThugRef.Enable()
; DLC2MogrulThugRef.AddItem(DLC2MogrulNote, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ActorBase Property DLC2Mogrul  Auto  

MiscObject Property Gold  Auto  

ObjectReference Property DLC2MogrulThugRef  Auto  

Book Property DLC2MogrulNote  Auto  
AchievementsScript Property AchievementsQuest Auto
