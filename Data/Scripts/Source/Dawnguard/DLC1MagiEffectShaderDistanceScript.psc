Scriptname DLC1MagiEffectShaderDistanceScript extends ActiveMagicEffect  
{This effect shader script will check the distance to the target and apply an effect shader. }


EffectShader property EffectShaderFX01 auto
Float property fSpellMaxRange = 2133.33 auto
{IMPORTANT!, This is measured in UNITS! The spell forms measure in FEET, but we don't want to convert it every time, so do it yourself! (Take your number and multiply it by 21.333)}
Float Property fFullWaitTime = 0.4 auto
Float Property fEffectShaderDuration = 1.5 auto

Event OnEffectStart(Actor Target, Actor Caster)
	
	EffectShaderFX01.stop(Target)
	Utility.wait(((Target.GetDistance(Caster) / fSpellMaxRange) * fFullWaitTime))
	EffectShaderFX01.play(Target,fEffectShaderDuration)

	; While this global is non-zero, player can't recast this spell
	DLC1DetectAllActive.Value = 1
EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	; allow spell to be cast again
	DLC1DetectAllActive.Value = 0	
EndEvent

GlobalVariable Property DLC1DetectAllActive  Auto  
