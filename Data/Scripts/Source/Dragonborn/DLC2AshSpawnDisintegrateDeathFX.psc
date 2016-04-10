Scriptname DLC2AshSpawnDisintegrateDeathFX extends ActiveMagicEffect  

import debug
import FormList

;======================================================================================;
;  PROPERTIES  /
;=============/

float property fDelay = 0.75 auto
									{time to wait before Spawning Ash Pile}
									
float property fDelayAlpha = 1.65 auto
; 									{time to wait before Setting alpha to zero.}
float property fDelayEnd = 1.65 auto
									{time to wait before Removing Base Actor}
float property ShaderDuration = 0.00 auto
									{Duration of Effect Shader.}
Activator property DLC2AshSpawnAshPile auto
									{The object we use as a pile.}
EffectShader property DLC2AshSpawnDisintegrateFXS auto

EffectShader property DLC2AshSpawnDisintegrateFXS02 auto
									{The Effect Shader we want.}
Bool property bSetAlphaZero = True auto
									{The Effect Shader we want.}
Bool property bSetAlphaToZeroEarly = False Auto
									{Use this if we want to set the acro to invisible somewhere before the effect shader is done.}

;======================================================================================;
;  VARIABLES   /
;=============/


actor Victim
race VictimRace
bool TargetIsImmune = True
; bool DeadAlready = FALSE

;======================================================================================;
;   EVENTS     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)
	victim = target
	; DeadAlready = Victim.IsDead()
	trace("victim == " + victim + ", is this right?")
EndEvent


Event OnDying(Actor Killer)

	DLC2AshSpawnDisintegrateFXS.play(Victim,ShaderDuration)
	DLC2AshSpawnDisintegrateFXS02.play(Victim,ShaderDuration)
		
		if bSetAlphaToZeroEarly
			Utility.wait(fDelayAlpha)
			victim.SetAlpha (0.0,True)
		endif
		utility.wait(fDelay)     
		Victim.AttachAshPile(DLC2AshSpawnAshPile)
		
		utility.wait(fDelayEnd)
		if	DLC2AshSpawnDisintegrateFXS != none
			DLC2AshSpawnDisintegrateFXS.stop(Victim)
			DLC2AshSpawnDisintegrateFXS02.stop(Victim)
		endif
		;if bSetAlphaZero == True
			;victim.SetAlpha (0.0,True)
		;endif
		victim.SetCriticalStage(Victim.CritStage_DisintegrateEnd)
	
	
EndEvent