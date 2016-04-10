;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
;NEXT FRAGMENT INDEX 34
Scriptname DLC1_QF_DLC1_BF_DunTempleQST_01006BDA Extends Quest Hidden

;BEGIN ALIAS PROPERTY WaveMarker03b
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaveMarker03b Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveMarker02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaveMarker02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FrostMiniBoss01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FrostMiniBoss01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerKnockdownMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerKnockdownMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY MiniBossMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_MiniBossMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY ZombieDragonNoFlyTrig
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_ZombieDragonNoFlyTrig Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FrostMiniBoss03
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FrostMiniBoss03 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DebrisController
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DebrisController Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BowPedestal
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BowPedestal Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY DisableFastTravelTRIG
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_DisableFastTravelTRIG Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TempFinale2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TempFinale2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossIceSpikes
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossIceSpikes Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FrostMiniBoss02
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FrostMiniBoss02 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY TempFinale
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_TempFinale Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveMarker01
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaveMarker01 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FrostMiniBoss04
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FrostMiniBoss04 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VampireDamageTriggersMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VampireDamageTriggersMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FakeInteriorWeatherTrig
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FakeInteriorWeatherTrig Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Serana
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Serana Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY PlayerKnockdownMarker2
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_PlayerKnockdownMarker2 Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveMarker03a
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaveMarker03a Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY WaveMarker03c
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_WaveMarker03c Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossFightLights
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossFightLights Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY Prince
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_Prince Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY BossIceShield
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_BossIceShield Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY SeranaKnockdownMarker
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_SeranaKnockdownMarker Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY VisBlockers
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_VisBlockers Auto
;END ALIAS PROPERTY

;BEGIN ALIAS PROPERTY FrostMiniBoss05
;ALIAS PROPERTY TYPE ReferenceAlias
ReferenceAlias Property Alias_FrostMiniBoss05 Auto
;END ALIAS PROPERTY

;BEGIN FRAGMENT Fragment_21
Function Fragment_21()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
;Set after Frost Atronach dies

;SetStage 720 so ceiling collapses know when to stop
SetStage(720)

kmyQuest.MUSCombat.Remove()

;Put invisible righthand teleknisis art on the prince (already has it on his right hand
DLC1SnowElfTelekinesisHandLEffect.Play(Alias_Prince.GetReference()) 

Alias_Prince.GetActorReference().EvaluatePackage()
kmyQuest.DLC1_BF_DunTempleQSTScene03.Start()
utility.Wait(2)
kmyQuest.FXRumbleFalmerBoss2D.Play(Alias_Prince.GetActorReference())
DLC01_SunAuraCloakEffect.Play(Alias_Prince.GetActorReference())
Alias_Prince.GetActorReference().SetSubGraphFloatVariable("ftoggleBlend", 1.0) 
(Alias_Prince.GetActorReference()).PlayIdle(kmyQuest.idleRitualSpellStart)
Game.ShakeController(0.3, 0.3, 8)
Game.ShakeCamera(Game.GetPlayer(), 0.3, 8)
kmyQuest.RitualCharge.ApplyCrossfade(8)
Game.DisablePlayerControls(false,true,true,false,true,true)
kmyQuest.DLC1_BF_DunTempleQSTSCENEShiftBack.Start()
Alias_TempFinale2.GetReference().PlayAnimation("Stage2")
Alias_TempFinale.GetReference().PlayAnimationAndWait("Stage2", "stage2State_to_stage3State")


;Allow Zombie dragon flying by disabling this trigger
if ((Alias_ZombieDragonNoFlyTrig.GetReference() as DLC1DurnehviirNoFlyingTrigSCRIPT).triggerDragonRef)
	((Alias_ZombieDragonNoFlyTrig.GetReference() as DLC1DurnehviirNoFlyingTrigSCRIPT).triggerDragonRef as Actor).SetAllowFlying(TRUE)
endif
((Alias_ZombieDragonNoFlyTrig.GetReference() as DLC1DurnehviirNoFlyingTrigSCRIPT).DLC1DurnehviirDisallowFlying).SetValue(0)
Alias_ZombieDragonNoFlyTrig.GetReference().DisableNoWait()

;Re-enable sun damage if the player is a vampire
(kmyQuest.SunDamageExceptionWorldSpaces).RemoveAddedForm(kmyQuest.DLC01FalmerValley)
(Alias_VisBlockers.GetReference()).Disable()
Alias_Prince.GetActorRef().SetGhost(true)
Alias_Serana.GetActorRef().SetGhost(true)
(Alias_Prince.GetActorReference()).PlayIdle(kmyQuest.idleRitualSpellRelease)
kmyQuest.DLC1_BF_DunTempleQSTSceneKnockdown.Start()
Alias_BossIceSpikes.GetReference().DisableNoWait()
Game.ShakeController(0.7, 0.7, 4)
Game.ShakeCamera(Game.GetPlayer(), 1, 4)
(Alias_Prince.GetActorReference()).KnockAreaEffect(1, 3000)
DLC01_SunAuraCloakEffect.Stop(Alias_Prince.GetActorReference())
Alias_Prince.GetActorReference().SetSubGraphFloatVariable("ftoggleBlend", 0.0) 
Alias_BossFightLights.GetReference().DisableNoWait()
kmyQuest.FullWhite.ApplyCrossfade(0.5)
utility.Wait(0.5)
Game.GetPlayer().Moveto(Alias_PlayerKnockdownMarker.GetReference())
Game.DisablePlayerControls(true,true,true,true,true,true)
Game.EnableFastTravel(false)
ImageSpaceModifier.RemoveCrossfade(3.0)
Alias_Serana.GetReference().Moveto(Alias_SeranaKnockdownMarker.GetReference())
Game.ForceFirstPerson()
Game.GetPlayer().PlayIdle(kmyQuest.TG05_KnockOut)
(Alias_DebrisController.GetReference() as DLC1_BF_FallingDebrisControllerSCRIPT).TryToDisableLightBeams()
Weather.ReleaseOverride()
SetStage(800)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_18
Function Fragment_18()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
;Set after completing 2nd wave
;Starts scene with prince
utility.Wait(1)
kmyQuest.DLC1_BF_DunTempleQSTScene01.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_30
Function Fragment_30()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
; Sets after the Start scene
kmyQuest.MUSCombat.Add()
Alias_WaveMarker01.GetReference().Activate(Alias_WaveMarker01.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_24
Function Fragment_24()
;BEGIN CODE
;Set from phase 1 of scene
Alias_DebrisController.GetReference().Activate(Alias_DebrisController.GetReference())
(Alias_DebrisController.GetReference() as DLC1_BF_FallingDebrisControllerSCRIPT).TimeBeforeEachPlayerCheck = 3
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_17
Function Fragment_17()
;BEGIN CODE
;Set after wave 1
;Starts wave 2

Alias_WaveMarker02.GetReference().Activate(Alias_WaveMarker02.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_16
Function Fragment_16()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
;Starts first scene with the Prince

kmyQuest.DLC1_BF_DunTempleQSTStart.Start()

((Alias_Prince.GetReference()) as Actor).PlayIdle(kmyQuest.SnowElfSit)

(Alias_FakeInteriorWeatherTrig.GetReference()).DisableNoWait()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_20
Function Fragment_20()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
;Set after wave 3
;Starts Scene with prince and Frost Atronach Boss
kmyQuest.DLC1_BF_DunTempleQSTScene02.Start()
utility.Wait(2)
if (Alias_FrostMiniBoss01.GetReference())
	(Alias_FrostMiniBoss01.GetReference() as defaultFakeSummonSpell).Summon()
	(Alias_FrostMiniBoss01.GetReference()).MoveToMyEditorLocation()
elseif (Alias_FrostMiniBoss02.GetReference())
	(Alias_FrostMiniBoss02.GetReference() as defaultFakeSummonSpell).Summon()
	(Alias_FrostMiniBoss02.GetReference()).MoveToMyEditorLocation()
elseif (Alias_FrostMiniBoss03.GetReference())
	(Alias_FrostMiniBoss03.GetReference() as defaultFakeSummonSpell).Summon()
	(Alias_FrostMiniBoss03.GetReference()).MoveToMyEditorLocation()
elseif (Alias_FrostMiniBoss04.GetReference())
	(Alias_FrostMiniBoss04.GetReference() as defaultFakeSummonSpell).Summon()
	(Alias_FrostMiniBoss04.GetReference()).MoveToMyEditorLocation()
elseif (Alias_FrostMiniBoss05.GetReference())
	(Alias_FrostMiniBoss05.GetReference() as defaultFakeSummonSpell).Summon()
	(Alias_FrostMiniBoss05.GetReference()).MoveToMyEditorLocation()
endif
utility.Wait(2)
if (Alias_FrostMiniBoss01.GetReference())
	(Alias_FrostMiniBoss01.GetActorReference()).AddToFaction(kmyQuest.DaedraFaction)
elseif (Alias_FrostMiniBoss02.GetReference())
	(Alias_FrostMiniBoss02.GetActorReference()).AddToFaction(kmyQuest.DaedraFaction)
elseif (Alias_FrostMiniBoss03.GetReference())
	(Alias_FrostMiniBoss03.GetActorReference()).AddToFaction(kmyQuest.DaedraFaction)
elseif (Alias_FrostMiniBoss04.GetReference())
	(Alias_FrostMiniBoss04.GetActorReference()).AddToFaction(kmyQuest.DaedraFaction)
elseif (Alias_FrostMiniBoss05.GetReference())
	(Alias_FrostMiniBoss05.GetActorReference()).AddToFaction(kmyQuest.DaedraFaction)
endif

;Disable changing into Vampire Lord
kmyQuest.DLC1VampireLordDisallow.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_28
Function Fragment_28()
;BEGIN CODE
;Set by stage 700 so ceiling collapses know when to stop
(Alias_DebrisController.GetReference() as DLC1_BF_FallingDebrisControllerSCRIPT).ControllerForceCollapse()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_19
Function Fragment_19()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
;After second scene with prince
;sends wave 3
(Alias_DebrisController.GetReference() as DLC1_BF_FallingDebrisControllerSCRIPT).TimeBeforeEachPlayerCheck = 6
Alias_WaveMarker03a.GetReference().Activate(Alias_WaveMarker03a.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_23
Function Fragment_23()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
;Sets up the prince for combat whether he was hit, or talked into combat
Alias_Prince.GetActorReference().RemoveFromFaction(kmyquest.DunPrisonerFaction)
Alias_Prince.GetActorReference().AddToFaction(kmyquest.FalmerFaction)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_14
Function Fragment_14()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
;Started by trigger in temple
((Alias_Prince.GetReference()) as Actor).PlayIdle(kmyQuest.SnowElfSit)

Game.EnableFastTravel(false)

(Alias_VisBlockers.GetReference()).Enable()

((Alias_Prince.GetReference()) as Actor).SetGhost(TRUE)

;Put invisible left hand teleknisis art on the prince
DLC1SnowElfTelekinesisHandREffect.Play(Alias_Prince.GetReference()) 

;Alias_Prince.GetReference().MoveToMyEditorLocation()

if (Alias_FrostMiniBoss01.GetReference())
	(Alias_FrostMiniBoss01.GetActorReference()).RemoveFromFaction(kmyQuest.DaedraFaction)
elseif (Alias_FrostMiniBoss02.GetReference())
	(Alias_FrostMiniBoss02.GetActorReference()).RemoveFromFaction(kmyQuest.DaedraFaction)
elseif (Alias_FrostMiniBoss03.GetReference())
	(Alias_FrostMiniBoss03.GetActorReference()).RemoveFromFaction(kmyQuest.DaedraFaction)
elseif (Alias_FrostMiniBoss04.GetReference())
	(Alias_FrostMiniBoss04.GetActorReference()).RemoveFromFaction(kmyQuest.DaedraFaction)
elseif (Alias_FrostMiniBoss05.GetReference())
	(Alias_FrostMiniBoss05.GetActorReference()).RemoveFromFaction(kmyQuest.DaedraFaction)
endif

;Setup waves of actors
((Alias_WaveMarker01.GetReference()) as DLC1_BF_WaveControllerSCRIPT).TryToSetupActors()
((Alias_WaveMarker02.GetReference()) as DLC1_BF_WaveControllerSCRIPT).TryToSetupActors()
((Alias_WaveMarker03a.GetReference()) as DLC1_BF_WaveControllerSCRIPT).TryToSetupActors()
((Alias_WaveMarker03b.GetReference()) as DLC1_BF_WaveControllerSCRIPT).TryToSetupActors()
((Alias_WaveMarker03c.GetReference()) as DLC1_BF_WaveControllerSCRIPT).TryToSetupActors()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_29
Function Fragment_29()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
;Set in 800 primarily for telling the prince when he can travel to the balcony

pDLC1VQ07.SetStage(130)
Alias_Prince.GetActorReference().EvaluatePackage()
utility.Wait(1)
;Game.GetPlayer().Moveto(Alias_PlayerKnockdownMarker2.GetReference())
(kmyquest.DLC1VQ07).SetStage(131)
;Game.GetPlayer().PlayIdle(kmyQuest.TG05_GetUp)
Alias_Prince.GetActorReference().RemoveFromFaction(kmyquest.DunPrisonerFaction)
utility.Wait(10)
Game.EnablePlayerControls(true,false,true,true,false,false,false,true)
Game.EnableFastTravel(false)
utility.Wait(1)
Alias_TempFinale.GetReference().DisableNoWait()
Alias_BowPedestal.GetReference().PlayAnimation("playanim02")
Alias_DisableFastTravelTRIG.GetReference().DisableNoWait()
Alias_VampireDamageTriggersMarker.GetReference().DisableNoWait()
kmyQuest.DLC1_BF_DunTempleQSTSCENEShiftBack.Start()
;Enable changing into Vampire Lord
kmyQuest.DLC1VampireLordDisallow.SetValue(0)
utility.Wait(2)
kmyQuest.QSTFalmerBossExplosionSettle2D.Play(Game.GetPlayer())
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_32
Function Fragment_32()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
;Set when the Frost Atronach boss dies
(Alias_WaveMarker03b.GetReference() as DLC1_BF_WaveControllerSCRIPT).CountDead()

if (Alias_FrostMiniBoss01.GetReference())
	(Alias_FrostMiniBoss01.GetReference() as defaultFakeSummonSpell).Banish()
	utility.Wait(0.5)
	(Alias_FrostMiniBoss01.GetReference() as defaultFakeSummonSpell).DisableNoWait()
elseif (Alias_FrostMiniBoss02.GetReference())
	(Alias_FrostMiniBoss02.GetReference() as defaultFakeSummonSpell).Banish()
	utility.Wait(0.5)
	(Alias_FrostMiniBoss02.GetReference() as defaultFakeSummonSpell).DisableNoWait()
elseif (Alias_FrostMiniBoss03.GetReference())
	(Alias_FrostMiniBoss03.GetReference() as defaultFakeSummonSpell).Banish()
	utility.Wait(0.5)
	(Alias_FrostMiniBoss03.GetReference() as defaultFakeSummonSpell).DisableNoWait()
elseif (Alias_FrostMiniBoss04.GetReference())
	(Alias_FrostMiniBoss04.GetReference() as defaultFakeSummonSpell).Banish()
	utility.Wait(0.5)
	(Alias_FrostMiniBoss04.GetReference() as defaultFakeSummonSpell).DisableNoWait()
elseif (Alias_FrostMiniBoss05.GetReference())
	(Alias_FrostMiniBoss05.GetReference() as defaultFakeSummonSpell).Banish()
	utility.Wait(0.5)
	(Alias_FrostMiniBoss05.GetReference() as defaultFakeSummonSpell).DisableNoWait()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_26
Function Fragment_26()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
((Alias_Prince.GetReference()) as Actor).PlayIdle(kmyQuest.SnowElfSit)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_22
Function Fragment_22()
;BEGIN AUTOCAST TYPE dlc1_bf_duntempleqstscript
Quest __temp = self as Quest
dlc1_bf_duntempleqstscript kmyQuest = __temp as dlc1_bf_duntempleqstscript
;END AUTOCAST
;BEGIN CODE
;Set in stage 700
Alias_BossIceShield.GetReference().DisableNoWait()
Alias_Prince.GetActorReference().EvaluatePackage()
SetStage(810)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

scene Property dunRannTrappedSCENE  Auto  

scene Property dunRannSneakySCENE  Auto  

Quest Property pDLC1VQ07  Auto  

VisualEffect Property DLC01_SunAuraCloakEffect  Auto  

VisualEffect Property DLC1SnowElfTelekinesisHandLEffect  Auto  

VisualEffect Property DLC1SnowElfTelekinesisHandREffect  Auto  
