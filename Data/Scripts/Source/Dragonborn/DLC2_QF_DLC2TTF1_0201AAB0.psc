;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 19
Scriptname DLC2_QF_DLC2TTF1_0201AAB0 Extends Quest Hidden

;BEGIN ALIAS PROPERTY Varona
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Varona Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Player
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Player Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Neloth
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Neloth Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AshGuardian
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AshGuardian Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Talvas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Talvas Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Elynea
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Elynea Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Ulves
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Ulves Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Drovas
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Drovas Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
; staff reward
Game.GetPlayer().AddItem(StaffReward, 1)
setStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
; Talvas greets player
Alias_Talvas.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
; Ash guardian is dead

SetObjectiveDisplayed(100, true)
SetObjectiveCompleted(100, true)
SetObjectiveDisplayed(200, true)

Alias_AshGuardian.GetRef().Disable(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
; player enters tower after seeing scene - trigger ash guardian
Alias_AshGuardian.GetRef().Enable()
; make sure scene is over
DLC2TTF1IntroScene.Stop()
Alias_Talvas.GetActorRef().EvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN CODE
; Quest completed, quest reward is given out in the topic script

SetObjectiveCompleted(200, true)
Alias_AshGuardian.GetRef().Disable()

DLC2AshGuardianSpellForSale.SetValue(0)
alias_Talvas.GetActorRef().SetRelationshipRank(Game.GetPlayer(), 1)
alias_Talvas.GetActorRef().SetFactionRank(PotentialFollowerFaction, 0)

AchievementsQuest.IncSideQuests()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
; player hears opening scene

Alias_Neloth.GetRef().MoveTo(DLC2TT2NelothCastMarker)
DLC2TelMithrynDoorRef.Lock(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN CODE
; player kills ash guardian without getting quest from Talva. This stage finishes

DLC2AshGuardianSpellForSale.SetValue(0)
SetObjectiveCompleted(100, true)

stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
; Player agrees to destroy ash guardian

SetObjectiveDisplayed(100, true)
; remove friend faction from Ash Guardian
Alias_AshGuardian.GetActorRef().RemoveFromFaction(DLC2TTF1AshGuardianFriendFaction)
Alias_AshGuardian.GetActorRef().EvaluatePackage() ; bring him out of ignore combat package
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
; player has reached level threshold
; NOTE: made this startup stage so it would always work
; can't have Tel Mithryn intro scene level dependent (also it wasn't fully implemented as level blocked)
; --KMK

Alias_Talvas.GetRef().MoveTo(DLC2TalvasWaitForIntroMarker)
Alias_Varona.GetRef().MoveTo(DLC2TalvasWaitForIntroMarker)
DLC2TelMithrynDoorRef.Lock(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
; ash guardian tome reward
Game.GetPlayer().AddItem(DLC2SpellTomeConjureAshGuardian, 1)
Game.GetPlayer().AddItem(DLC2HeartStone, 1)
setStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN CODE
; player has entered Tel Mithryn
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

SPELL Property DLC2AshGuardian  Auto  

Book Property DLC2SpellBookConjureAshGuardian  Auto  

GlobalVariable Property DLC2AshGuardianSpellForSale  Auto  

ObjectReference Property DLC2TalvasWaitForIntroMarker  Auto  

Faction Property CurrentFollowerFaction  Auto  

AchievementsScript Property AchievementsQuest Auto

LeveledItem Property StaffReward  Auto  

Book Property DLC2SpellTomeConjureAshGuardian  Auto  

MiscObject Property DLC2HeartStone  Auto  

Faction Property DLC2TTF1AshGuardianFriendFaction  Auto  

Scene Property DLC2TTF1IntroScene  Auto  

Faction Property PotentialFollowerFaction  Auto  

ObjectReference Property DLC2TT2NelothCastMarker  Auto  

ObjectReference Property DLC2TelMithrynDoorRef  Auto  
