Scriptname DLC1VQ04SeranaSoulTrapFX extends ActiveMagicEffect  
{This script fakes a soul trap effect for when Serana soul traps the player in DLC1VQ04}

ImageSpaceModifier property TrapImod auto
{IsMod applied when we trap a soul}
sound property TrapSoundFX auto ; create a sound property we'll point to in the editor
{Sound played when we trap a soul}
VisualEffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}
VisualEffect property CasterVFX auto
{Visual Effect on Caster aming at Target}
EffectShader property CasterFXS auto
{Effect Shader on Caster during Soul trap}
EffectShader property TargetFXS auto
{Effect Shader on Target during Soul trap}

Event OnEffectStart(Actor Target, Actor Caster)
	TrapSoundFX.play(Caster)       ; play TrapSoundFX sound from player
	TrapImod.apply()                                  ; apply isMod at full strength
	TargetVFX.Play(Target,4.7,Caster)              ; Play TargetVFX and aim them at the player
	CasterVFX.Play(Caster,5.9,Target)
	TargetFXS.Play(Target,2)    						; Play Effect Shaders
	CasterFXS.Play(Caster,3)
endEvent