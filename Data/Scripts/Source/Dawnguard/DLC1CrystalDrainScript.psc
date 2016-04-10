Scriptname DLC1CrystalDrainScript extends ActiveMagicEffect  

{Scripted effect for Playing Visual Effects on the Soul Cairn crystal trap.}

import debug
import game

ImageSpaceModifier property TrapImod auto
{IsMod applied with this effect}
ImageSpaceModifier property FadeImod auto
{IsMod applied with this effect}

keyword property crystalLight auto

VisualEffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}
VisualEffect property CasterVFX auto
{Visual Effect on Caster aiming at Target}

sound property SoundLoop auto
;sound to play when visual effects are active
int instanceID



Event OnEffectStart(Actor Target, Actor Caster)
	;debug.trace("magic effect start")
			if Target == GetPlayer()
				TrapImod.applyCrossFade(1)                                  ; if player, apply imod
				instanceID = SoundLoop.play(Target)
			endif

			if TargetVFX
			;debug.trace("effect playing")
				TargetVFX.Play(Target, akfacingObject = Caster)              ; Play TargetVFX and aim them at the caster
			endif
			if CasterVFX
				CasterVFX.Play(Caster, akfacingObject = Target)
			endif
		if Caster.getLinkedRef(crystalLight).isenabled() == 0
			Caster.getLinkedRef(crystalLight).enable()
		endif

EndEvent

Event OnEffectFinish(Actor Target, Actor Caster)
	;debug.trace("magic effect finished")
		if Target == GetPlayer()
			ImageSpaceModifier.RemoveCrossFade(1)                             ; if player, remove Imod
			Sound.stopInstance(instanceID)
		endif

		if TargetVFX
		;debug.trace("effect stop")
			TargetVFX.Stop(Target)              ; Play TargetVFX and aim them at the player
		endif
		if CasterVFX
			CasterVFX.Stop(Caster)
		endif
		if Caster.getLinkedRef(crystalLight).isenabled() == 1 
			Caster.getLinkedRef(crystalLight).disable()
		endif
endevent