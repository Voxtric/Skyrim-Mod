Scriptname DLC1MagicHarkonDeathFXScript extends ActiveMagicEffect  
{This is a script to test death effects for the Harkon Fight.}

armor property DLC1VampireSkeletonFXArmor auto
effectshader property DLC1VampireBleedHarkonDeathFXS auto
effectshader property DLC1VampireBleedHarkonFireFXS auto

Actor CasterActor


Event OnEffectStart(Actor akTarget, Actor akCaster)

	CasterActor = akCaster
	CasterActor.PlaySubGraphAnimation("TransitionAnim")
	DLC1VampireBleedHarkonDeathFXS.Play(CasterActor,0.1)

	CasterActor.SetSubGraphFloatVariable("fdampRate", 0.005) ;;sp`eeds up fade rate (max 1 min .1
	CasterActor.SetSubGraphFloatVariable("ftoggleBlend", 1.3) ;;blends between two anims default 0 (0 = there 1 = gone)
	CasterActor.ClearExtraArrows()

	utility.wait(1.5)
	DLC1VampireBleedHarkonFireFXS.Play(CasterActor,0.5)

EndEvent


Event OnEffectFinish(Actor akTarget, Actor akCaster)

	CasterActor.PlaySubGraphAnimation("TransitionAnim")
	utility.wait(6.0)

	; CasterActor.SetSubGraphFloatVariable("fdampRate", 0.1) ;;speeds up fade rate (max 1 min .1
	; CasterActor.SetSubGraphFloatVariable("ftoggleBlend", -0.1);;blends between two anims default 0 (0 = there 1 = gone)
EndEvent
