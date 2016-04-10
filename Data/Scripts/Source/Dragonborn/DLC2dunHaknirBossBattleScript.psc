Scriptname DLC2dunHaknirBossBattleScript extends Actor 
{Haknir boss battle script in Gyldenhul Barrow.}

;Haknir Treasure Quest
Quest property DLC2dunHaknirTreasureQST Auto

;Boss spawn points.
ObjectReference property DLC2dunGyldenhulHaknirSpawn01 Auto
ObjectReference property DLC2dunGyldenhulHaknirSpawn02 Auto
ObjectReference property DLC2dunGyldenhulHaknirSpawn03 Auto
ObjectReference property DLC2dunGyldenhulHaknirSpawn04 Auto

;Linked chain of flames and lights around the spawn points.
ObjectReference property DLC2dunGyldenhulRitual01 Auto
ObjectReference property DLC2dunGyldenhulRitual02 Auto
ObjectReference property DLC2dunGyldenhulRitual03 Auto

;'Safety' point Haknir moves to when he warps out.
ObjectReference property DLC2dunGyldenhulHaknirSafety Auto

;Boss Battle Managers
ObjectReference property DLC2dunGyldenhulBattleManager01 Auto
ObjectReference property DLC2dunGyldenhulBattleManager02 Auto
ObjectReference property DLC2dunGyldenhulBattleManager03 Auto

;Boss Battle Manager Checks (become enabled when each manager is finished).
ObjectReference property DLC2dunGyldenhulComplete01 Auto
ObjectReference property DLC2dunGyldenhulComplete02 Auto
ObjectReference property DLC2dunGyldenhulComplete03 Auto

;Buff applied to Haknir during the final phase.
Spell property DLC2dunHaknirBuff Auto

;Haknir's second sword.
Weapon property DLC2dunHaknirScimitar02 Auto

;Phase
int phase

;VFX
Activator property SummonValorTargetFXActivator Auto	;Distortion

;SFX
Sound property MAGFlamesImpact Auto

Actor property player Auto

;Ghost FX properties.
Explosion property defaultGhostDeathExplosion Auto
EffectShader property pGhostFXShader auto
Container property pDefaultGhostCorpse auto
Explosion property pdefaultGhostDeathExplosion auto
LeveledItem property pdefaultGhostLeveledList auto
Spell property pGhostAbilityNew auto
Spell property pGhostResistsAbility auto
float property fDelay = 0.75 auto
{time to wait before Spawning Ash Pile}
float property fDelayEnd = 1.65 auto
{time to wait before Removing Base Actor}
float property ShaderDuration = 0.00 auto
{Duration of Effect Shader.}
Activator property pDefaultAshPileGhost auto
{The object we use as a pile.}
Bool property bSetAlphaZero = True auto
{The Effect Shader we want.}
FormList property pDisintegrationMainImmunityList auto
{If the target is in this list, they will not be disintegrated.}
EFFECTSHADER property pGhostDeathFXShader auto
{the shader to play while dying}

Event OnInit()
	player = Game.GetPlayer()
EndEvent

Event OnLoad()
	Self.AddSpell(pGhostAbilityNew)
	Self.AddSpell(pGhostResistsAbility)
	Self.SetGhost(False)
	Self.BlockActivation(True)
	Self.SetNoFavorAllowed(True)
EndEvent

Function OnDying(Actor killer)
	UnregisterForUpdate()
	Self.PlaceAtMe(defaultGhostDeathExplosion)
	;Self.PlaceAtMe(DLC2dunHaknirScimitar02)	;Now placing Soulrender in his ash pile.
	Self.SetCriticalStage(Self.CritStage_DisintegrateStart)
	pGhostDeathFXShader.play(Self,ShaderDuration)
	Self.SetAlpha (0.0,True)
	Self.AttachAshPile(pDefaultAshPileGhost)
	Self.BlockActivation(False)
	Self.SetNoFavorAllowed(False)
	Utility.wait(fDelayEnd)
	pGhostDeathFXShader.stop(Self)
	Self.SetAlpha(0.0,True)
	Self.SetCriticalStage(Self.CritStage_DisintegrateEnd)
	(DLC2dunGyldenhulBattleManager01 as DLC2dunHaknirProgressiveCombat).KillAllEnemies()
	(DLC2dunGyldenhulBattleManager02 as DLC2dunHaknirProgressiveCombat).KillAllEnemies()
	(DLC2dunGyldenhulBattleManager03 as DLC2dunHaknirProgressiveCombat).KillAllEnemies()
	DisableRitualLights(DLC2dunGyldenhulRitual01)
	DisableRitualLights(DLC2dunGyldenhulRitual02)
	DisableRitualLights(DLC2dunGyldenhulRitual03)
	DLC2dunHaknirTreasureQST.SetStage(100)
EndFunction 

Function StartBattlePhase(int newPhase)
; 	;Debug.Trace("StartBattlePhase: " + newPhase)
	if (newPhase == 0)
		;INITIAL: Just Haknir. He spawns in and attacks.
		Utility.Wait(2)
		EnableRitualLights(DLC2dunGyldenhulRitual01, 0.2)
		Utility.Wait(1)
		Self.SetAV("Variable07", 1)
		Self.EvaluatePackage()
		Self.MoveTo(DLC2dunGyldenhulHaknirSpawn01)
		DLC2dunGyldenhulHaknirSpawn01.PlaceAtMe(SummonValorTargetFXActivator)
		Utility.Wait(1)
		Self.MoveTo(DLC2dunGyldenhulHaknirSpawn01)
		Self.EnableNoWait(True)
		Utility.Wait(1)
		Self.SetAV("Variable07", 0)
		Self.EvaluatePackage()
		Self.StartCombat(player)
		player.CreateDetectionEvent(player, 75)
	ElseIf (newPhase == 1)
		;PHASE 1: Haknir warps out, ghost combat.
		Self.SetGhost(True)
		Self.DispelAllSpells()
		Self.SetAV("Variable07", 1)
		Self.EvaluatePackage()
		Self.PlaceAtMe(SummonValorTargetFXActivator)
		Utility.Wait(1)
		Self.SetAlpha(0, True)
		Self.MoveTo(DLC2dunGyldenhulHaknirSafety)
		Utility.Wait(1)
		DLC2dunGyldenhulBattleManager01.Activate(Self)
		Utility.Wait(1)
		player.CreateDetectionEvent(player, 75)
	ElseIf (newPhase == 2)
		;PHASE 2: Haknir warps back in and attacks, joined by two lieutenants.
		EnableRitualLights(DLC2dunGyldenhulRitual02, 0.1)
		EnableRitualLights(DLC2dunGyldenhulRitual03, 0.1)
		Self.SetGhost(False)
		if (Self.GetAVPercentage("Health") < 0.5)
			Self.RestoreAV("Health", (Self.GetAV("Health") / 2) - ((Self.GetAV("Health") * Self.GetAVPercentage("Health")) / 2))
		EndIf
		Self.MoveTo(DLC2dunGyldenhulHaknirSpawn04)
		Self.PlaceAtMe(SummonValorTargetFXActivator)
		Utility.Wait(1)
		DLC2dunGyldenhulBattleManager02.Activate(Self)
		Self.SetAlpha(0.33, True)
		Utility.Wait(1)
		Self.SetAV("Variable07", 0)
		Self.EvaluatePackage()
		Self.StartCombat(player)
		player.CreateDetectionEvent(player, 75)
	ElseIf (newPhase == 3)
		;PHASE 3: Haknir warps out. We only advance to Phase 4 when at Phase 3 and both lieutenants are dead.
		Self.SetGhost(True)
		Self.DispelAllSpells()
		Self.SetAV("Variable07", 1)
		Self.EvaluatePackage()
		Self.PlaceAtMe(SummonValorTargetFXActivator)
		Self.SetAlpha(0, True)
		Self.MoveTo(DLC2dunGyldenhulHaknirSafety)
	ElseIf (newPhase == 4)
		;PHASE 4: Haknir is down, and his two lieutenants have been killed. Time for more ghost combat.
		Utility.Wait(2)
		DLC2dunGyldenhulBattleManager03.Activate(Self)
		Utility.Wait(1)
		player.CreateDetectionEvent(player, 75)
	ElseIf (newPhase == 5)
		;PHASE 5: Haknir warps in for the last time, alone, but with a buff.
		Utility.Wait(2)
		Self.SetGhost(False)
		Self.MoveTo(DLC2dunGyldenhulHaknirSpawn01)
		Self.PlaceAtMe(SummonValorTargetFXActivator)
		Utility.Wait(1)
		Self.SetAlpha(0.33, True)
		Utility.Wait(1)
		Self.SetAV("Variable07", 0)
		Self.EvaluatePackage()
		DLC2dunHaknirBuff.Cast(Self, Self)
		Self.StartCombat(player)
		player.CreateDetectionEvent(player, 75)
	EndIf
	phase = newPhase
	RegisterForSingleUpdate(1)
; 	;Debug.Trace("StartBattlePhase Concludes: " + newPhase)
EndFunction

Event OnHit(ObjectReference akAggressor, form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	if (phase == 0)
		;INITIAL: Just Haknir. He spawns in and attacks.
		;Warp him out when his health falls below 70%.
; 		;Debug.Trace("OnHit for Phase " + phase + ", Health%=" + Self.GetAVPercentage("Health"))
		if (Self.GetAVPercentage("Health") < 0.7 && Self.GetAV("Health") > 0)
			UnregisterForUpdate()
			StartBattlePhase(1)
		EndIf
	ElseIf (phase == 1)
		;PHASE 1: Haknir warps out, ghost combat.
		;Nothing to look for here.
	ElseIf (phase == 2)
		;PHASE 2: Haknir warps back in and attacks, joined by two lieutenants.
		;Warp him out when his health falls below 40%.
; 		;Debug.Trace("OnHit for Phase " + phase + ", Health%=" + Self.GetAVPercentage("Health"))
		if (Self.GetAVPercentage("Health") < 0.5 && Self.GetAV("Health") > 0)
			UnregisterForUpdate()
			StartBattlePhase(3)
		EndIf
	ElseIf (phase == 3)
		;PHASE 3: Player is still fighting Haknir's lieutenants.
		;Nothing to look for here.
	ElseIf (phase == 4)
		;PHASE 4: Haknir is down, and his two lieutenants have been killed. Time for more ghost combat.
		;Nothing to look for here.
	EndIf
EndEvent

Event OnUpdate()
; 	;Debug.Trace("HAKNIR UPDATE----")
	if (phase == 0)
		;INITIAL: Just Haknir. He spawns in and attacks.
		;Nothing to look for in OnUpdate. OnHit handles this one.
; 		;Debug.Trace("OnUpdate for Phase " + phase)
		RegisterForSingleUpdate(1)
	ElseIf (phase == 1)
		;PHASE 1: Haknir warps out, ghost combat.
		;When the BattleManager reports that all enemies have been killed, advance to Phase 2.
; 		;Debug.Trace("OnUpdate for Phase " + phase + " Manager State is: " + !DLC2dunGyldenhulComplete01.IsDisabled())
		if (!DLC2dunGyldenhulComplete01.IsDisabled())
			StartBattlePhase(2)
		Else
			RegisterForSingleUpdate(1)
		EndIf
	ElseIf (phase == 2)
		;PHASE 2: Haknir warps back in and attacks, joined by two lieutenants.
		;Nothing to look for in OnUpdate. OnHit handles this one.
; 		;Debug.Trace("OnUpdate for Phase " + phase)
		RegisterForSingleUpdate(1)
	ElseIf (phase == 3)
		;PHASE 3: Player is still fighting Haknir's lieutenants.
		;When the BattleManager reports that all enemies have been killed, advance to Phase 4.
; 		;Debug.Trace("OnUpdate for Phase " + phase + " Manager State is: " + !DLC2dunGyldenhulComplete02.IsDisabled())
		if (!DLC2dunGyldenhulComplete02.IsDisabled())
			StartBattlePhase(4)
		Else
			RegisterForSingleUpdate(1)
		EndIf
	ElseIf (phase == 4)
		;PHASE 4: Haknir is down, and his two lieutenants have been killed. Time for more ghost combat.
		;When the BattleManager reports that all enemies have been killed, advance to Phase 5.
; 		;Debug.Trace("OnUpdate for Phase " + phase + " Manager State is: " + !DLC2dunGyldenhulComplete03.IsDisabled())
		if (!DLC2dunGyldenhulComplete03.IsDisabled())
			StartBattlePhase(5)
		Else
			RegisterForSingleUpdate(1)
		EndIf	
		;No longer any need to update.
	EndIf
EndEvent

Function EnableRitualLights(ObjectReference RitualLight, Float delay)
	MAGFlamesImpact.Play(RitualLight)
	RitualLight.EnableNoWait(True)
	Utility.Wait(delay)
	if (RitualLight.GetLinkedRef() != None)
		EnableRitualLights(RitualLight.GetLinkedRef(), delay)
	EndIf
EndFunction

Function DisableRitualLights(ObjectReference RitualLight)
	RitualLight.DisableNoWait(True)
	if (RitualLight.GetLinkedRef() != None)
		DisableRitualLights(RitualLight.GetLinkedRef())
	EndIf
EndFunction