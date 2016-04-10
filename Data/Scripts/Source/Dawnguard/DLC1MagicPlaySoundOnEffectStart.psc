Scriptname DLC1MagicPlaySoundOnEffectStart extends ActiveMagicEffect  
{This script is for playing a sound on spell cast. Yous should only use this on a self spell that has no area.}

import utility

;======================================================================================;
;               PROPERTIES  /
;=============/

Sound property SoundFX auto
{main Effect Shader for spell}
Sound property SoundFX02 auto
{2nd Effect Shader for spell}
Sound property SoundFX03 auto
{3rd Effect Shader for spell}

Float Property fDelay = 0.0 auto
{Delay the effect add for this amount of time.}

Bool Property bCasterOnly = True auto
Bool bCanStillPlaySound = True
;======================================================================================;
;	 EVENTS     /
;=============/

Event OnEffectStart(Actor Target, Actor Caster)
	if bCasterOnly
		if Target != Caster
			bCanStillPlaySound = False
		endif
	endif

	wait(fDelay)

	if bCanStillPlaySound
		if SoundFX
			SoundFX.Play(Target)
		endif
		if SoundFX02
			SoundFX02.Play(Target)
		endif
		if SoundFX03
			SoundFX03.Play(Target)
		endif
	endif
EndEvent
