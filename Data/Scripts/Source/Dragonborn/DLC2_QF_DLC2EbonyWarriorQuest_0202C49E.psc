;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 8
Scriptname DLC2_QF_DLC2EbonyWarriorQuest_0202C49E Extends Quest Hidden

;BEGIN ALIAS PROPERTY EbonyWarrior
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_EbonyWarrior Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CityCenter
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CityCenter Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Shadowmere
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Shadowmere Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StartCity
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_StartCity Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY LastVigil
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_LastVigil Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Ebony warrior is dead

SetObjectiveCompleted(100, true)
DLC2EBRun.SetValue(1)
game.GetPlayer().RemovePerk(DLC2EbonyWarriorPickpocketMod)

AchievementsQuest.IncSideQuests()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
ObjectReference EbonyWarriorRef

EbonyWarriorRef = Alias_EbonyWarrior.GetRef()
EbonyWarriorRef.Enable()
EbonyWarriorRef.MoveTo(alias_CityCenter.GetRef())
game.GetPlayer().AddPerk(DLC2EbonyWarriorPickpocketMod)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Ebony warrior has issued his challenge

SetObjectiveCompleted(10, true)
SetObjectiveDisplayed(100, true)

alias_LastVigil.GetRef().AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Forcegreet succeeded, but the player exited early. Close down the package.

SetObjectiveDisplayed(10, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC2EBRun  Auto  

AchievementsScript Property AchievementsQuest Auto

Perk Property DLC2EbonyWarriorPickPocketMod  Auto  
