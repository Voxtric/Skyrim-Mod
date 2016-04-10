;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 24
Scriptname DLC1_QF_DLC1HunterBaseIntro_01004E24 Extends Quest Hidden

;BEGIN ALIAS PROPERTY ForgottenFallsExtDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ForgottenFallsExtDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FlorentiusAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FlorentiusAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CelannAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_CelannAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BaseExteriorDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BaseExteriorDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeaconVigilant2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BeaconVigilant2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GunmarDungeonReference
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GunmarDungeonReference Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeaconVigilant1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BeaconVigilant1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DurakAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DurakAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FlorentiusMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FlorentiusMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SeranaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SeranaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushCreature2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushCreature2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushCreature3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushCreature3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY IsranAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_IsranAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StendarrsBeaconLocAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_StendarrsBeaconLocAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GunmarDungeonBossMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GunmarDungeonBossMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY AmbushCreature1
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_AmbushCreature1 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GunmarDungeonLocationAlias
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_GunmarDungeonLocationAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ArielleDwarvenRuinAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ArielleDwarvenRuinAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SorineAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SorineAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BeaconVigilant3
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BeaconVigilant3 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BearAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BearAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GunmarAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GunmarAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TolanAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TolanAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(50)
if GetStageDone(40) == 1
if GetStageDone(50) == 1
SetStage(70)
endif
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
SetActive()
SetObjectiveDisplayed(20)
Alias_BeaconVigilant1.GetReference().Disable()
Alias_BeaconVigilant2.GetReference().Disable()
;Alias_TolanAlias.GetReference().MoveTo(TolanWanderMarker)
;Alias_TolanAlias.GetActorReference().EvaluatePackage()
DLC1HunterBaseIntroAmbushTriggerRef.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_15
Function Fragment_15()
;BEGIN CODE
if DLC1HallNormalState.IsDisabled() == 0
DLC1HallNormalState.Disable()
endif



SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN CODE
;run if player has joined vampires, just to get rid of actors we no longer need for questline and get isran back in the fort
;also completes quest so it isn't left running for rest of game
Alias_IsranAlias.GetReference().MoveTo(IsranEndMarker)
Alias_IsranAlias.GetActorReference().EvaluatePackage()
Alias_TolanAlias.GetReference().Disable()
Alias_BeaconVigilant1.GetReference().Disable()
Alias_BeaconVigilant2.GetReference().Disable()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_5
Function Fragment_5()
;BEGIN AUTOCAST TYPE DLC1HunterBaseIntroQuestScript
Quest __temp = self as Quest
DLC1HunterBaseIntroQuestScript kmyQuest = __temp as DLC1HunterBaseIntroQuestScript
;END AUTOCAST
;BEGIN CODE
if DLC1VQ02.GetStageDone(40) == 0
CompleteAllObjectives()
DLC1VQ03Hunter.SetStage(5)
kmyquest.DLC1Radiant.IntroQuestCompleted(isHunterQuest = true)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
SetObjectiveDisplayed(60)
Alias_BaseExteriorDoor.GetReference().Lock(false, true)
DLC1HunterHQEXTInitEnabled02.Disable()
DLC1HunterHQExtrasInitEnabled.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_13
Function Fragment_13()
;BEGIN CODE
If IsObjectiveDisplayed(40)
SetObjectiveCompleted(40,1)
endif
if IsObjectiveDisplayed(47)
SetObjectiveCompleted(47)
endif
if GetStageDone(40) == 1
;if GetStageDone(60) == 1
SetStage(70)
;endif
Alias_IsranAlias.GetReference().MoveTo(IsranEndMarker)

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;SetObjectiveDisplayed(10)
;Alias_IsranAlias.GetReference().MoveTo(IsranIntroSceneMarker)
CreatureFaction.SetAlly(DLC1HunterBaseIntroBearFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_7
Function Fragment_7()
;BEGIN CODE
SetObjectiveCompleted(20)
DLC1GunmarFaction.SetAlly(PlayerFaction)
Alias_SorineAlias.GetReference().MoveTo(Alias_ArielleDwarvenRuinAlias.GetReference())

Alias_GunmarAlias.GetReference().MoveTo(Alias_GunmarDungeonReference.GetReference())
Alias_SorineAlias.GetReference().EnableNoWait()
Alias_GunmarAlias.GetReference().EnableNoWait()
;Alias_FlorentiusAlias.GetReference().MoveTo(Alias_FlorentiusMarker.GetReference())
DLC1HunterIntroSatchelRef.EnableNoWait()
SetObjectiveDisplayed(30)
SetObjectiveDisplayed(40)
;SetObjectiveDisplayed(50)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
SetObjectiveCompleted(40)
SetObjectiveDisplayed(45)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
SetObjectiveCompleted(30)
if GetStageDone(50) == 1
;if GetStageDone(60) == 1
SetStage(70)
;endif
Alias_IsranAlias.GetReference().MoveTo(IsranEndMarker)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC1HunterIntroSatchelRef  Auto  

ObjectReference Property IsranIntroSceneMarker  Auto  

Quest Property DLC1VQ03Hunter  Auto  

ObjectReference Property DLC1HallNormalState  Auto  

ObjectReference Property IsranEndMarker  Auto  

Faction Property DLC1HunterBaseIntroBearFaction  Auto  

Faction Property CreatureFaction  Auto  

ObjectReference Property TolanIntroSceneMarker  Auto  

ObjectReference Property VigilantIntroSceneMarker1  Auto  

ObjectReference Property VigilantIntroSceneMarker2  Auto  

ObjectReference Property VigilantIntroSceneMarker3  Auto  

ObjectReference Property TolanWanderMarker  Auto  

ObjectReference Property DLC1HunterBaseIntroDurakGuardMarker  Auto  

ObjectReference Property DLC1HunterBaseIntroCelannGuardMarker  Auto  

Quest Property DLC1VQ02  Auto  

Actor Property Serana  Auto  

Ammo Property ElderScrollAmmo  Auto  

ObjectReference Property DLC1HunterBaseIntroAmbushTriggerRef  Auto  

Quest Property AchievementsQuest  Auto  

ObjectReference Property DLC1HunterHQEXTInitEnabled02  Auto  

ObjectReference Property DLC1HunterHQExtrasInitEnabled  Auto  

Faction Property DLC1GunmarFaction  Auto  

Faction Property PlayerFaction  Auto  
