Scriptname DLC1KeeperSoulSpellFXScript extends ActiveMagicEffect  


import Debug
import Utility


VisualEffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}
VisualEffect property CasterVFX auto
{Visual Effect on Caster aiming at Target}


Event OnEffectStart(Actor Target, Actor Caster)
	;debug.trace("magic effect start")
			if TargetVFX
			;debug.trace("effect playing")
;				TargetVFX.Play(Target, akfacingObject = Caster)              ; Play TargetVFX and aim them at the caster
			endif
			if CasterVFX
				CasterVFX.Play(Caster, akfacingObject = Target)
			endif
EndEvent
