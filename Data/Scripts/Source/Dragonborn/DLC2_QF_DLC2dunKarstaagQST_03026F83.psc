;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 5
Scriptname DLC2_QF_DLC2dunKarstaagQST_03026F83 Extends Quest Hidden

;BEGIN ALIAS PROPERTY KarstaagSkullStatic
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarstaagSkullStatic Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SkullSpawnPoint
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SkullSpawnPoint Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY CastleKarstaagLocation
;ALIAS PROPERTY TYPE LocationAlias
LocationAlias Property Alias_CastleKarstaagLocation Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY KarstaagSkullItem
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_KarstaagSkullItem Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Karstaag
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Karstaag Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_2
Function Fragment_2()
;BEGIN CODE
;Player kills Karstaag.

;Remove Blizzard spell.
;DLC2dunKarstaagBlizzardDisabler.Activate(Alias_Karstaag.GetReference())

;'Absorb' Karstaag.
TargetVFX.Play(Alias_Karstaag.GetActorRef(),4,Game.GetPlayer())
CasterVFX.Play(Game.GetPlayer(),4,Alias_Karstaag.GetActorRef())
TargetFXS.Play(Alias_Karstaag.GetActorRef(),4)
CasterFXS.Play(Game.GetPlayer(),4)
Utility.Wait(3)
Game.GetPlayer().AddSpell(DLC2ConjureKarstaag)
(Alias_Karstaag.GetActorRef() as DLC2dunKarstaagGhostScript).DissolveKarstaag()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_0
Function Fragment_0()
;BEGIN CODE
;Player finds Karstaag's Skull in Mortrag Glacier Ruins.
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_3
Function Fragment_3()
;BEGIN CODE
;TEMP - Bump up the size of Karstaag's Temp Skull so it doesn't look so ridiculous.
Alias_KarstaagSkullItem.GetReference().SetScale(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_1
Function Fragment_1()
;BEGIN CODE
;Player places Karstaag's Skull onto the throne.
Game.GetPlayer().RemoveItem(Alias_KarstaagSkullItem.GetReference())
Alias_KarstaagSkullStatic.GetReference().Enable()

;Camera Shake and Rumble.
AmbRumbleShake.Play(Game.GetPlayer())

;Karstaag's Bones play VFX and fade out.
ObjectReference current = Alias_KarstaagSkullStatic.GetReference()
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

;Knock back player if we need to make room.
;if (Game.GetPlayer().GetDistance(DLC2dunKarstaagStartMarker) < 256)
;    DLC2dunKarstaagEjectPlayer.Cast(DLC2dunKarstaagKnockbackForceMarker, Game.GetPlayer())
;    Utility.Wait(2)
;EndIf

;Enable Kaarstag
Alias_Karstaag.GetReference().PlaceAtMe(SummonTargetFXActivator)
Alias_Karstaag.GetReference().Enable(True)

;Cast Karstaag's Blizzard spell.
;DLC2dunKarstaagBlizzardEnabler.Activate(Alias_Karstaag.GetReference())
;Alias_Karstaag.GetActorRef().DoCombatSpellApply(DLC2dunKarstaagBlizzard, DLC2dunKarstaagBlizzardTarget)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property AMBRumbleShake  Auto  
Sound Property AmbRumbleShakeGreybeards Auto

ObjectReference Property DLC2dunKarstaagStartMarker  Auto  

ObjectReference Property DLC2dunKarstaagKnockbackForceMarker  Auto  

SPELL Property DLC2dunKarstaagBlizzard  Auto  

ObjectReference Property DLC2dunKarstaagBlizzardTarget  Auto  

SPELL Property DLC2dunKarstaagEjectPlayer  Auto  

SPELL Property DLC2ConjureKarstaag  Auto  

VisualEffect property TargetVFX auto
VisualEffect property CasterVFX auto
EffectShader property TargetFXS auto
EffectShader property CasterFXS auto



Activator Property SummonTargetFXActivator  Auto  
