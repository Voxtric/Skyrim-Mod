Scriptname DLC2AshSpawnDeathScript extends Actor  

;======================================================================================;
;  PROPERTIES  /
;=============/

float property fDelay = 0.75 auto
									{time to wait before Spawning Ash Pile}
; float property fDelayAlpha = 1.65 auto
; 									{time to wait before Setting alpha to zero.}
float property fDelayEnd = 1.65 auto
									{time to wait before Removing Base Actor}
float property ShaderDuration = 0.00 auto
									{Duration of Effect Shader.}
Activator property AshPileObject auto
									{The object we use as a pile.}
EffectShader property MagicEffectShader auto
									{The Effect Shader we want.}
Bool property bSetAlphaZero = True auto
									{The Effect Shader we want.}

Event OnDying(actor akKiller)
	SetCriticalStage(CritStage_DisintegrateStart)
	;victim.SetAlpha (0.99,False)
	if	MagicEffectShader != none
		MagicEffectShader.play(self, ShaderDuration)
	endif
	utility.wait(fDelay)     
	self.AttachAshPile(AshPileObject)
	; AshPileRef = AshPileObject
	; AshPileRef.SetAngle(0.0,0.0,(Victim.GetAngleZ()))
	utility.wait(fDelayEnd)
	if	MagicEffectShader != none
		MagicEffectShader.stop(self)
	endif
	if bSetAlphaZero == True
		self.SetAlpha (0.0,True)
	endif
	SetCriticalStage(CritStage_DisintegrateEnd)
EndEvent