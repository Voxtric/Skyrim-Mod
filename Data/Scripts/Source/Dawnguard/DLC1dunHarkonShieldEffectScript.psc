Scriptname DLC1dunHarkonShieldEffectScript extends ActiveMagicEffect  

Spell property DLC1dunHarkonDrainCloak Auto
Spell property DLC1dunHarkonEjectPlayer Auto
ObjectReference property DLC1HarkonFontRef Auto
ObjectReference property DLC1dunHarkonShadowShieldRef Auto
ObjectReference property DLC1dunHarkonAbsorbFX Auto
ObjectReference property DLC1dunHarkonShrineLight Auto
ObjectReference property VQ08ShrineEventMarker Auto
ReferenceAlias property HarkonAlias Auto
Explosion property DLC1HarkonShieldAurielsBowExplosion Auto

Event OnEffectStart(Actor Target, Actor Caster)
	;Debug.Trace(Caster + " cast Harkon's Shield!")
	Caster.GetActorBase().SetInvulnerable(True)
	Caster.AddSpell(DLC1dunHarkonDrainCloak)
	;If the player is inside the shield sphere, throw them out.
	;Debug.Trace("Player Position Check: " + Game.GetPlayer().GetDistance(VQ08ShrineEventMarker))
	if (Game.GetPlayer().GetDistance(VQ08ShrineEventMarker) < 225)
		;Debug.Trace("Check: " + Caster + ", " + DLC1dunHarkonEjectPlayer)
		Caster.DoCombatSpellApply(DLC1dunHarkonEjectPlayer, Game.GetPlayer())
	EndIf
	DLC1dunHarkonShadowShieldRef.EnableNoWait(False)

	While DLC1dunHarkonShadowShieldRef.Is3dLoaded() == False
		utility.wait(0.1)
	endwhile

	DLC1dunHarkonShadowShieldRef.PlayAnimation("StartEffectAnim")
	DLC1dunHarkonShrineLight.EnableNoWait(True)
	DLC1dunHarkonAbsorbFX.EnableNoWait(True)
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	;Debug.Trace(Caster + " released Harkon's Shield!")
	Caster.GetActorBase().SetInvulnerable(False)
	Caster.RemoveSpell(DLC1dunHarkonDrainCloak)
	DLC1dunHarkonShrineLight.DisableNoWait(True)
	DLC1dunHarkonAbsorbFX.DisableNoWait(True)
	if ((HarkonAlias as DLC1dunHarkonBossBattle).ShieldDestroyed)
		;Debug.Trace("Destroying shield.")
		DLC1dunHarkonShadowShieldRef.PlaceAtMe(DLC1HarkonShieldAurielsBowExplosion)
		DLC1dunHarkonShadowShieldRef.PlayAnimationAndWait("DestroyShieldAnim", "End")
		DLC1dunHarkonShadowShieldRef.Disable(False)
	Else
		;Debug.Trace("Dismissing shield.")
		DLC1dunHarkonShadowShieldRef.PlayAnimationAndWait("StopEffect", "End")
		DLC1dunHarkonShadowShieldRef.Disable(False)
	EndIf
	;Debug.Trace("Shield Removed Successfully.")
EndEvent