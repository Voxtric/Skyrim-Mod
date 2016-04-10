Scriptname DLC1GargoyleBruteHandFXScript extends ActiveMagicEffect  


VisualEffect property TargetVFX auto
{Visual Effect on Target aiming at Caster}

bool bIsReadyToGo = False


	Event OnEffectStart(Actor Target, Actor Caster)
		if TargetVFX
			TargetVFX.Play(Target)        
		endif
		bIsReadyToGo = True
	EndEvent

	Event OnEffectFinish(Actor Target, Actor Caster)
		While bIsReadyToGo == False
			Utility.Wait(0.1)
		EndWhile

		if TargetVFX
			TargetVFX.Stop(Target)            
		endif
	endevent