;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 12
Scriptname DLC2_QF_DLC2dunKarstaagQST_020247F8 Extends Quest Hidden

;BEGIN ALIAS PROPERTY CastleKarstaagLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CastleKarstaagLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarstaagSkullChest
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarstaagSkullChest Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarstaagSkullItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarstaagSkullItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Karstaag
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Karstaag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarstaagSkullActivator
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarstaagSkullActivator Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ConjuredKarstaag
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ConjuredKarstaag Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarstaagSkullOnThrone
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarstaagSkullOnThrone Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;Nothing to do here.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_10
Function Fragment_10()
;BEGIN CODE
;Player has summoned Karstaag twice.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_9
Function Fragment_9()
;BEGIN CODE
;The quest shuts down once the player has summoned Karstaag for the last time.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_11
Function Fragment_11()
;BEGIN CODE
;Player has summoned Karstaag once.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player places Karstaag's Skull onto the throne.
Game.GetPlayer().RemoveItem(Alias_KarstaagSkullItem.GetReference())
Alias_KarstaagSkullOnThrone.GetReference().Enable()

;Camera Shake and Rumble.
AmbRumbleShake.Play(Game.GetPlayer())

;Karstaag's Bones play VFX and fade out.
ObjectReference current = Alias_KarstaagSkullOnThrone.GetReference()
While (current != None)
     (current as DLC2dunKarstaagBoneFXScript).TriggerBones()
     Utility.Wait(0.1)
     current = current.GetLinkedRef()
EndWhile
Utility.Wait(2)

;BIG Camera Shake and Rumble.
Game.ShakeController(0.75, 0.75, 3)
Game.ShakeCamera(None, 0.5, 3)
AmbRumbleShake.Play(Game.GetPlayer())

;Enable the trigger, enable Karstaag, and start the battle.
(KarstaagBattleTrigger as DLC2dunKarstaagBattleTriggerScript).StartBattle()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player finds Karstaag's Skull in the Glacial Cave.
Alias_KarstaagSkullActivator.GetReference().Disable()
DLC2KarstaagSkullTrigger.Disable()
Game.GetPlayer().AddItem(Alias_KarstaagSkullItem.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player kills Karstaag.

;Disable trigger.
(KarstaagBattleTrigger as DLC2dunKarstaagBattleTriggerScript).KarstaagKilled()

;'Absorb' Karstaag.
TargetVFX.Play(Alias_Karstaag.GetActorRef(),4,Game.GetPlayer())
CasterVFX.Play(Game.GetPlayer(),4,Alias_Karstaag.GetActorRef())
TargetFXS.Play(Alias_Karstaag.GetActorRef(),4)
CasterFXS.Play(Game.GetPlayer(),4)
Utility.Wait(3)
Game.GetPlayer().AddSpell(DLC2ConjureKarstaag)
(Alias_Karstaag.GetActorRef() as DLC2dunKarstaagGhostScript).DissolveKarstaag()

;Enable throne furniture.
DLC2dunKarstaagThroneFurniture.Enable()
;DLC2dunKarstaagThroneTrigger.Enable()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property AMBRumbleShake  Auto  
Sound Property AmbRumbleShakeGreybeards Auto

ObjectReference Property DLC2dunKarstaagKnockbackForceMarker  Auto  

SPELL Property DLC2dunKarstaagBlizzard  Auto  

SPELL Property DLC2ConjureKarstaag  Auto  

VisualEffect property TargetVFX auto
VisualEffect property CasterVFX auto
EffectShader property TargetFXS auto
EffectShader property CasterFXS auto

ObjectReference Property DLC2KarstaagSkullTrigger  Auto  

ObjectReference Property KarstaagBattleTrigger  Auto  

ObjectReference Property DLC2dunKarstaagThroneFurniture  Auto  

ObjectReference Property DLC2dunKarstaagThroneTrigger  Auto  
