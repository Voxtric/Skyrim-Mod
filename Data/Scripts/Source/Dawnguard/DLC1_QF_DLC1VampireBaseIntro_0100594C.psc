;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 18
Scriptname DLC1_QF_DLC1VampireBaseIntro_0100594C Extends Quest Hidden

;BEGIN ALIAS PROPERTY RedwaterDenDoor02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RedwaterDenDoor02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY GaranAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_GaranAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Bloodspring
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Bloodspring Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY RedwaterDenDoor
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_RedwaterDenDoor Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SaloniaAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SaloniaAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StalfSpringMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StalfSpringMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY OrthjolfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_OrthjolfAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SaloniaSpringMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SaloniaSpringMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VingalmoAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VingalmoAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SecretDoorParent
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SecretDoorParent Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DLC1VampireBaseIntroChaliceAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DLC1VampireBaseIntroChaliceAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY HoldingChestRef
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_HoldingChestRef Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FilledChaliceAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FilledChaliceAlias Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY StalfAlias
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_StalfAlias Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN CODE
DLC1VampireBaseGaranChaliceScene.Start()
SetObjectiveCompleted(10)
SetObjectiveDisplayed(15)
TutorialThrall.GetReference().Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_12
Function Fragment_12()
;BEGIN CODE
SetObjectiveCompleted(50,1)
SetObjectiveDisplayed(60,1)
Alias_RedwaterDenDoor.GetReference().Lock(false)
Alias_RedwaterDenDoor02.GetReference().Lock(False)
Alias_RedwaterDenDoor02.GetReference().SetLockLevel(0)
; clear the elder scroll off of Serana
Serana.UnequipItem(ElderScrollAmmo)
Serana.RemoveItem(ElderScrollAmmo)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE dlc1vampirebaseintroquestscript
Quest __temp = self as Quest
dlc1vampirebaseintroquestscript kmyQuest = __temp as dlc1vampirebaseintroquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(60)
DLC1VQ03Vampire.Start()
Game.GetPlayer().RemoveItem(Alias_FilledChaliceAlias.GetReference(), 1)
CompleteAllObjectives()
kmyquest.DLC1Radiant.ChaliceFilled() ;turns on activator
kmyquest.DLC1Radiant.IntroQuestCompleted(isVampireQuest = true)
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
DLC1VampireFaction.SetAlly(DLC1SeranaFaction)
SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_6
Function Fragment_6()
;BEGIN CODE
SetObjectiveCompleted(20,1)
SetObjectiveDisplayed(30,1)
Alias_RedwaterDenDoor.GetReference().Lock()
Alias_SaloniaAlias.GetActorReference().RemoveFromFaction(DLC1VampireFaction)
Alias_StalfAlias.GetActorReference().RemoveFromFaction(DLC1VampireFaction)
;Disable the closed secret door, enable the open secret door
Alias_SecretDoorParent.getReference().Enable(Alias_SecretDoorParent.getReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
SetObjectiveCompleted(40,1)
SetObjectiveDisplayed(50,1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
SetObjectiveDisplayed(10,1)
Alias_GaranAlias.GetActorReference().EvaluatePackage()
Alias_GaranAlias.GetActorReference().MovetoPackageLocation()
Alias_VingalmoAlias.GetReference().MoveTo(VingalmoSceneMarker)
Alias_OrthjolfAlias.GetReference().MoveTo(OrthjolfSceneMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_4
Function Fragment_4()
;BEGIN AUTOCAST TYPE dlc1vampirebaseintroquestscript
Quest __temp = self as Quest
dlc1vampirebaseintroquestscript kmyQuest = __temp as dlc1vampirebaseintroquestscript
;END AUTOCAST
;BEGIN CODE
SetObjectiveCompleted(15,1)
SetObjectiveDisplayed(20,1)
Game.GetPlayer().AddItem(Alias_DLC1VampireBaseIntroChaliceAlias.GetReference())
kmyquest.DLC1Radiant.ChaliceRemoved() ;turns off activator
RedwaterDenMapMarker.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_8
Function Fragment_8()
;BEGIN CODE
SetObjectiveDisplayed(35,0)
SetObjectiveDisplayed(40,1)
Alias_StalfAlias.GetActorReference().GetActorBase().SetEssential(False)
Alias_SaloniaAlias.GetActorReference().GetActorBase().SetEssential(False)

DLC1VampireIntroEnemyFaction.SetEnemy(PlayerFaction)

;Clean up Serana's room back at the castle
;	The player is garunteed not to be in the castle
CastleController.CleanSeranasRoom()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DLC1VampireIntroEnemyFaction  Auto  

Faction Property PlayerFaction  Auto  

Quest Property DLC1VQ03Vampire  Auto  

Scene Property DLC1VampireBaseGaranChaliceScene  Auto  

Faction Property DLC1VampireFaction  Auto  

ObjectReference Property VingalmoSceneMarker  Auto  

ObjectReference Property OrthjolfSceneMarker  Auto  

Faction Property DLC1SeranaFaction  Auto  

Actor Property Serana  Auto  

Ammo Property ElderScrollAmmo  Auto  

DLC1VampireCastleControllerScript Property CastleController Auto


Quest Property AchievementsQuest  Auto  

ReferenceAlias Property TutorialThrall  Auto  

ObjectReference Property RedwaterDenMapMarker  Auto  
