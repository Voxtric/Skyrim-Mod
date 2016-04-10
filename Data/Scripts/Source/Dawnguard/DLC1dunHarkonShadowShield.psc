Scriptname DLC1dunHarkonShadowShield extends ObjectReference  
{Script for Harkon's Shadow Shield Activator.}

ReferenceAlias property DLC1VQ08HarkonAlias Auto
MagicEffect property DLC1EnchSunDamage Auto
MagicEffect property DLC1EnchSunDamageArrow Auto
Actor property player Auto

Event OnCellAttach()
	;GoToState("Ready")
	player = Game.GetPlayer()
EndEvent


;Event OnMagicEffectApply(ObjectReference akCaster, MagicEffect akEffect)
;	DLC1dunHarkonBossBattle battle = DLC1VQ08HarkonAlias as DLC1dunHarkonBossBattle
;	if (akEffect == DLC1EnchSunDamage || akEffect == DLC1EnchSunDamageArrow)
;		OnHit(player, player.GetEquippedWeapon(), None, None, None, None, None)
;	EndIf
;EndEvent

;On hit, check conditions and forward the event to Harkon's script if necessary.
Event OnHit(ObjectReference aggressor, Form weap, Projectile proj, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked)
	;Debug.Trace("Shadow Shield: " + aggressor + ", " + weap + ", " + (DLC1VQ08HarkonAlias as DLC1dunHarkonBossBattle).HarkonBossBattleState)
	DLC1dunHarkonBossBattle battle = DLC1VQ08HarkonAlias as DLC1dunHarkonBossBattle
	If (battle.HarkonBossBattleState == 4 && weap == battle.DLC1AurielsBow)
		battle.EndShrineEvent(aggressor as Actor, weap as Weapon)
	Else
		CheckScene()
	EndIf
EndEvent


Auto State Ready
	Function CheckScene()
		GoToState("Busy")
		DLC1dunHarkonBossBattle battle = DLC1VQ08HarkonAlias as DLC1dunHarkonBossBattle
		float currentTime = Utility.GetCurrentRealTime()
		If (battle.HarkonBossBattleState == 4 && currentTime - battle.ShrineEventSceneTimer > 5 && !battle.DLC1VQ08HarkonBattleScene.IsPlaying() && battle.PlayerHasAurielsBow)
			battle.ShrineEventSceneTimer = currentTime
			battle.DLC1VQ08HarkonBattleScene.Start()
		EndIf
		GoToState("Ready")
	EndFunction
EndState

State Busy
	Function CheckScene()
		;Do Nothing
	EndFunction
EndState

Function CheckScene()
	;Do Nothing
EndFunction